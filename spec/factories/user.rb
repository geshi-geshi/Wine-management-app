FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'サンプルユーザー' }
    email { 'email@sample.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { true }
  end
end