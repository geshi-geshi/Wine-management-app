require 'rails_helper'

RSpec.describe WinesController, type: :controller do

  describe "GET #new" do
    # it "returns http success" do
    #   get :new
    #   expect(response).to have_http_status(:success)
    # end
  end

  describe "#index" do
    # 正常なレスポンスか？
    it "responds successfully" do
      get :index
      expect(response).to be_success
    end
    # 200レスポンスが返ってきているか？
    it "returns a 200 response" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

end
