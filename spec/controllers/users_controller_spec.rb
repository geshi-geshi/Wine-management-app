require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include SessionsHelper
  let(:user) { create(:user) }
 
  describe 'GET #show' do
    context 'ユーザーがログインしている場合' do
      before do
        log_in(user)      
      end
     
      it 'リクエストが成功すること' do
        get :show, params: { id: user.id }
        expect(response.status).to eq 200
      end

      it 'showテンプレートで表示されること' do
        get :show, params: { id: user.id }
        expect(response).to render_template :show
      end

      it 'userが取得できていること' do
        get :show, params: { id: user.id }
        expect(assigns :user).to eq user
      end
    end
    

    context 'ユーザーが存在しない場合' do
      subject { -> { get :show, params: { id: 100 } } }

      it { is_expected.to raise_error ActiveRecord::RecordNotFound }
    end
  end
end
