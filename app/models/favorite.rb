class Favorite < ApplicationRecord
  # Favorite 側は一人の User に属する
  belongs_to :user
  belongs_to :wine
end
