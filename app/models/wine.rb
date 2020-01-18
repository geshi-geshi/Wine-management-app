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

	# enum color: { "" => 0, "スパークリング" => 1, "ロゼ" => 2, "白" => 3, "赤" => 4, "オレンジ" => 5 }
	# enum body: { "" => 0, "ライトボディ" => 1, "ミディアムボディ" => 2, "フルボディ" => 3 }
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



	# enum color: [
	#     "", 
	#     "フランス", 
	#     "イタリア", 
	#     "スペイン",
	#     "ドイツ",
	#     "ルクセンブルク",
	#     "イギリス",
	#     "スペイン",
	#     "ポルトガル",
	#     "オーストリア",
	#     "ハンガリー",
	#     "モルドバ",
	#     "北アフリカ",
	#     "アメリカ合衆国",
	#     "カナダ",
	#     "アルゼンチン",
	#     "チリ",
	#     "南アフリカ",
	#     "オーストラリア",
	#     "ニュージーランド",
	#     "中国",
	#     "日本",
	#     "その他"
	# ] 
end
