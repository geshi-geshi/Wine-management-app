require 'rails_helper'

RSpec.describe User, type: :model do
    it "ユーザーを登録すると、それぞれの情報が取得できること" do
      user = User.new(
        name: "サンプルユーザー1",
        email: "email2@sample.com",
        password:              "password",
        password_confirmation: "password"
      )
      expect(user.name).to eq "サンプルユーザー1"
    end
  end