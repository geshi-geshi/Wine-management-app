class Wine < ApplicationRecord
	#この行を追記することで関連付くイベントが削除されるとfavoritesも削除される
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

	enum grape_variety: [
			"カベルネ・ソーヴィニヨン", 
			"カベルネ・フラン", 
			"ガメイ",
			"カリニャン",
			"カルメネール",
			"グルナッシュ",
			"サンジョベーゼ",
			"シラー",
			"シラーズ",
			"ジンファンデル",
			"テンプラニーリョ",
			"ネッビオーロ",
			"ピノ・ノワール",
			"マスカット・ベーリーA" ,
			"メルロー",
			"モンテプルチャーノ",
			"アルバリーニョ",
			"ヴィオニエ",
			"ゲヴュルツトラミネール",
			"甲州",
			"シャルドネ",
			"シュナン・ブラン",
			"セミヨン",
			"ソーヴィニヨン・ブラン",
			"ピノ・グリ",
			"ピノ・ブラン",
			"フィアーノ",
			"モスカート",
			"リースリング",
			"その他"
	]
end
