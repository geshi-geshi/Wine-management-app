require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  
  it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
    expect(user).to be_valid
  end

  it "それぞれの情報が取得できること" do
    expect(user.name).to eq "サンプルユーザー"
    expect(user.email).to eq "email@sample.com"
    expect(user.password).to eq "password"
  end

  it "nameが空では登録できない" do
    test_user = User.new(name: "", email: "email2@sample.com", password:"password", password_confirmation: "password")
    test_user.valid?
    expect(test_user).not_to be_valid
    expect(test_user.errors[:name]).to include("を入力してください")
  end

  it "nameが51文字以上では登録できない" do
    testName = "a" * 51
    test_user = User.new(name: testName, email: "email2@sample.com", password:"password", password_confirmation: "password")
    test_user.valid?
    expect(test_user).not_to be_valid
    expect(test_user.errors[:name]).to include("は50文字以内で入力してください")
  end

  it "emailが空では登録できない" do 
    test_user = User.new(name: "tesuser", email: "", password:"password", password_confirmation: "password")
    test_user.valid?
    expect(test_user).not_to be_valid
    expect(test_user.errors[:email]).to include("を入力してください")
  end

  it "emailが101文字以上では登録できない" do
    testEmail = "a" * 101 + "@mail.com"
    test_user = User.new(name: "tesuser", email: testEmail, password:"password", password_confirmation: "password")
    test_user.valid?
    expect(test_user).not_to be_valid
    expect(test_user.errors[:email]).to include("は100文字以内で入力してください")
  end

  it "emailが既に存在する場合は登録できない" do
    user2 = User.create(name: "testuser2", email: "email@sample.com", password:"password", password_confirmation: "password")
    test_user = User.new(name: user2.name, email: user2.email, password: user2.password, password_confirmation: user2.password_confirmation)
    expect(test_user).not_to be_valid
    expect(test_user.errors[:email]).to include("はすでに存在します")
  end

  it "password、password_confirmationが異なる場合は登録できない" do
    test_user = User.new(name: "testuser", email: "email2@sample.com", password:"password", password_confirmation: "password2")
    test_user.valid?
    expect(test_user).not_to be_valid
    expect(test_user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
  end

end