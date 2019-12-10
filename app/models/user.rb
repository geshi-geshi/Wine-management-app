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
  def self.find_or_create_from_auth_hash(auth_hash)
    provider  = auth_hash[:provider]　#providerはどのサービスで認証したのかを見分けるもの
    id        = auth_hash[:id]
    name  = auth_hash[:info][:name]
    # image_url = auth_hash[:info][:image]
 
    #find_or_create_by()は()の中の条件のものが見つければ取得し、なければ新しく作成するというメソッド
    self.find_or_create_by(provider: provider,id: id) do |user|
      user.name = name
      # user.image_url = image_url
    end
  end
end
