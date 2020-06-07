class Wine < ApplicationRecord
  # この行を追記することで関連付くイベントが削除されるとfavoritesも削除される
  has_many :favorites, dependent: :destroy
  # favoriteモデルを経由してuserテーブルと繋がる
  has_many :users, through: :favorites

  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: { maximum: 100 }
  validates :color, presence: true
  validates :grape_variety, presence: true
  validates :country, presence: true
  validates :region, length: { maximum: 50 }
  validates :area, length: { maximum: 50 }
  validates :producer, length: { maximum: 100 }
  validates :appearance, length: { maximum: 200 }
  validates :aroma, length: { maximum: 200 }
  validates :taste, length: { maximum: 200 }
  validates :production_year, length: { maximum: 4 }

  enum grape_variety: { "カベルネ・ソーヴィニヨン" => 0, "カベルネ・フラン" => 1, "ガメイ" => 2, "カリニャン" => 3, "カルメネール" => 4, "グルナッシュ" => 5, "サンジョベーゼ" => 6, "シラー" => 7, "シラーズ" => 8, "ジンファンデル" => 9, "テンプラニーリョ" => 10, "ネッビオーロ" => 11, "ピノ・ノワール" => 12, "マスカット・ベーリーA" => 13, "メルロー" => 14, "モンテプルチャーノ" => 15, "アルバリーニョ" => 16, "ヴィオニエ" => 17, "ゲヴュルツトラミネール" => 18, "甲州" => 19, "シャルドネ" => 20, "シュナン・ブラン" => 21, "セミヨン" => 22, "ソーヴィニヨン・ブラン" => 23, "ピノ・グリ" => 24, "ピノ・ブラン" => 25, "フィアーノ" => 26, "モスカート" => 27, "リースリング" => 28, "その他" => 29 }
end
