class User < ApplicationRecord
  before_save :email_downcase, unless: :uid?
  validates :name, presence: true, unless: :uid?, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, unless: :uid?, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                    has_secure_password validations: false
  # on: :facebook_loginでパスワードのバリデーションを無視する
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true, on: :facebook_login
                  

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

  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    name = auth[:info][:name]
    image = auth[:info][:image]

    self.find_or_create_by(provider: provider, uid: uid) do |user|
      user.name = name
      user.image_url = image
    end
  end


  private

  def email_downcase
    self.email.downcase!
  end

end
