class User < ApplicationRecord
	#この行を追記することで関連付くイベントが削除されるとfavoritesも削除される
  has_many :favorites, dependent: :destroy 
  has_many :wines, through: :favorites
  
  before_save :email_downcase, unless: :uid?
  validates :name, presence: true, unless: :uid?, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, unless: :uid?, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  # on: :sns_loginでパスワードのバリデーションを無視する
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true, on: :sns_login
                  
  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    name = auth[:info][:name]
    email = auth[:info][:email]
    image = auth[:info][:image]

    self.find_or_create_by(provider: provider, uid: uid, email: email) do |user|
      user.name = name
      user.email = email
      user.image_url = image
    end
  end


  private

  def email_downcase
    self.email.downcase!
  end

end
