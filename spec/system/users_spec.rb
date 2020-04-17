require 'rails_helper'

RSpec.feature 'ログインとログアウト' do
  # ユーザー作成
  let(:user) { create(:user) }
  scenario 'ログインする' do
    # ログインページを開く
    visit login_path

    expect(page).to have_content('ログイン')

    # ログインフォームにメールアドレスとパスワードを入力する
    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password
    # ログインボタンをクリックする
    click_on 'ログイン'
    # ログインに成功したことを検証する
    expect(page).to have_content('ログインしました')
    expect(page).to have_content('ワイン一覧')
  end
end
