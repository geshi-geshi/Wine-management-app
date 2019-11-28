User.create!(
    name: "管理者ユーザー",
    email: "email@sample.com",
    admin: true,
    password:              "testpassword",
    password_confirmation: "testpassword")

User.create!(
    name: "テストユーザー",
    email: "test@sample.com",
    password:              "testpassword",
    password_confirmation: "testpassword")
    

