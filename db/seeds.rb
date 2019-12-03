# User.create!(
#     name: "管理者ユーザー",
#     email: "testadmin@sample.com",
#     admin: true,
#     password:              "testpassword",
#     password_confirmation: "testpassword")

# User.create!(
#     name: "テストユーザー",
#     email: "test@sample.com",
#     password:              "testpassword",
#     password_confirmation: "testpassword")

60.times do |n|
    name  = Faker::Name.name
    email = "sample-#{n+1}@email.com"
    password = "password"
    User.create!(name: name,
                    email: email,
                    password: password,
                    password_confirmation: password)
end
    

