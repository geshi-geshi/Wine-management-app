class User < ApplicationRecord
	before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # twitter連携ログイン機能
  # def self.find_or_create_from_auth(auth)
  #   provider = auth[:provider]
  #   uid = auth[:uid]
  #   name = auth[:info][:name]
  #   image_url = auth[:info][:image_url]

  #   self.find_or_create_by(provider: provider, uid: uid) do |user|
  #     user.id = uid
  #     user.name = name
  #     user.image_url = image_url
  #     user.admin = false
  #   end
  # end

  validates :password, presence: true, length: {minimum: 8}, on: :facebook_login



  def self.from_omniauth(auth)
    user = User.where('email = ?', auth.info.email).first
    if user.blank?
       user = User.new
    end
    user.uid   = auth.uid
    user.name  = auth.info.name
    user.email = auth.info.email
    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user
  end

end
