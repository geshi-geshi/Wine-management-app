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
    body: "フルボディ",
    grape_variety: 12,
    country: "フランス",
    region: "ブルゴーニュ",
    area: "コートドール",
    appearance: "色の濃い赤、深みのある",
    aroma: "華やかで強いアロマはロマネ・コンティならでは、紅茶や土の香りなど複雑みもあり、官能的な余韻は非常に長く続きます",
    taste: "妖艶でエレガント、ピノノワールの味わいを全て凝縮したような風格ある味わいです",
    production_year: 1993,
    alcohol_content: 13,
    price: "1000000",
    detail: "ロマネ・コンティの生産本数は毎年僅か6000本前後のため、品質もさることながら希少性も相まって非常に高値で取引されています。概ねワインの価格は需要と供給のバランスで決まりますから、世界中の需要に対してロマネ・コンティの生産本数は少なすぎるのです。現在、価格はオフヴィンテージであっても１本（750ml）100万円は下らず、良年のワインなら200万円〜300万円の値がつくこともしばしば。さらに今後も価格は上昇すると予想されます。"
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
    

