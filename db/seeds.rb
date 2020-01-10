User.create!(
    name: "管理者ユーザー",
    email: "testadmin@sample.com",
    admin: true,
    password:              "testpassword",
    password_confirmation: "testpassword")

User.create!(
    name: "テストユーザー",
    email: "test@sample.com",
    password:              "testpassword",
    password_confirmation: "testpassword")

60.times do |n|
    name  = Faker::Name.name
    email = "sample-#{n+1}@email.com"
    password = "password"
    User.create!(name: name,
                    email: email,
                    password: password,
                    password_confirmation: password)
end

Wine.create!(
    name: "ロマネ・コンティ",
    color: "赤",  
    grape_variety: "ピノ・ノワール",
    country: "フランス",
    region: "ブルゴーニュ",
    area: "コートドール",
    body: "フルボディ",
    producer: "",
    appearance: "色の濃い赤、深みのある",
    aroma: "華やかで強いアロマはロマネ・コンティならでは、紅茶や土の香りなど複雑みもあり、官能的な余韻は非常に長く続きます",
    taste: "妖艶でエレガント、ピノノワールの味わいを全て凝縮したような風格ある味わいです",
    production_year: 1993,
    alcohol_content: 13,
    price: "1000000",
    capacity: 720,
    detail: "ロマネ・コンティの生産本数は毎年僅か6000本前後のため、品質もさることながら希少性も相まって非常に高値で取引されています。概ねワインの価格は需要と供給のバランスで決まりますから、世界中の需要に対してロマネ・コンティの生産本数は少なすぎるのです。現在、価格はオフヴィンテージであっても１本（750ml）100万円は下らず、良年のワインなら200万円〜300万円の値がつくこともしばしば。さらに今後も価格は上昇すると予想されます。"
)

Wine.create!(
    name: "モスカート・スプマンテ・ブリュット",
    color: "スパークリング",
    grape_variety: "モスカート",
    country: "イタリア",
    region: "ヴェネト",
    area: "",
    body: "",
    producer: "",
    appearance: "",
    aroma: "",
    taste: "",
    production_year: "",
    alcohol_content: "",
    price: "",
    capacity: "",
    detail: ""
)

Wine.create!(
    name: "シャブリ",
    color: "白",
    grape_variety: "甲州",
    country: "日本",
    region: "山梨",
    area: "勝沼町",
    body: "",
    producer: "",
    appearance: "",
    aroma: "",
    taste: "",
    production_year: "",
    alcohol_content: "",
    price: "",
    capacity: "",
    detail: ""
)

Wine.create!(
    name: "グレイス甲州",
    color: "白",
    grape_variety: "シャルドネ",
    country: "フランス",
    region: "ブルゴーニュ",
    area: "シャブリ",
    body: "",
    producer: "",
    appearance: "澄んで輝きのある僅かにグレーがかった淡いレモンイエローの色調。",
    aroma: "香りのボリュームは中程度でグレープフルーツ、その果皮の香り、
            コリアンダー、白コショウのスパイス香り、僅かにヨードの香りを感じます。",
    taste: "まろやかな口当たり、ほんのり甘みを感じる辛口、溌剌とした酸味、
            柑橘系の果実味とスパイスの風味、ほのかな苦みがアクセントとなっています。
            甲州の果皮の成分をうまく引き出した飲み心地良い白ワインです。",
    production_year: 2018,
    alcohol_content: 12,
    price: 1980,
    capacity: "",
    detail: "全体的に降水量が少なく、日照時間は長い。
            6～9月は雨が少なくて病気が防げた。　
            8～10月は日照時間が長く昼夜の寒暖差が大きかったのでブドウが良く成熟した。
            17℃の一定温度管理のステンレスタンクで約2週間発酵。シュールリーで熟成。
            澱には強い還元力があるので、攪拌することによってワインを平均化し、苦味や渋みを柔らかくします。"
)

Wine.create!(
    name: "シャノン・ヴィンヤード・マウント・バレット・メルロー",
    color: "赤",
    grape_variety: "メルロー",
    country: "南アフリカ",
    region: "エルギン",
    area: "",
    body: "フルボディ",
    producer: "シャノン・ヴィンヤード",
    appearance: "",
    aroma: "プラム、ブラックベリー、ミントやスパイス、土のニュアンスにミネラルを感じさせる複雑な香りです。",
    taste: "もの柔らかなレッド系果実やクワの実といった信じられないほど複雑な味わい",
    production_year: 2014,
    alcohol_content: 14,
    capacity: 750,
    detail: "南アフリカで開かれた[ケープ・ワイン・フェア　2008]
で初めてシャノン・ヴィンヤードが披露され、世界中か
ら集まった多くのワイン関係者が、そのポテンシャルの
高さに驚愕し、一躍世界中に知れ渡りました。


また、有名なイギリスのワイン評論家、ヒュー・ジョン
ソンさん著者の「ポケット・ワイン・ブック　2010年」
でも、

『2010年に注目すべき5大ワインブランド』

に選出されているほど、今や南アフリカにとどまらず、
世界中でそのクオリティの高さとコストパフォーマンス
の凄さが注目されています。
"
)






20.times do |n|
    Wine.create!(
        name: "ワイン#{n+1}",
        color: "白",
        body: "ライトボディ",
        grape_variety: "シャルドネ",
        country: "フランス",
        region: "ブルゴーニュ",
        area: "コートドール",
        appearance: "外観はテストです",
        aroma: "香りはテストです",
        taste: "味わいはテストです",
        production_year: 2010,
        alcohol_content: 13,
        price: "10000",
        detail: "テストの概要です"
    )
end

20.times do |n|
    Wine.create!(
        name: "ワイン#{n+21}",
        color: "赤",
        body: "フルボディ",
        grape_variety: 1,
        country: "フランス",
        region: "ボルドー",
        area: "",
        appearance: "外観はテストです",
        aroma: "香りはテストです",
        taste: "味わいはテストです",
        production_year: 2000,
        alcohol_content: 13,
        price: "20000",
        detail: "テストの概要です"
    )
end
    

