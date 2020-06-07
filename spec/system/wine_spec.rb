require 'rails_helper'

RSpec.feature '/wines' do
  let(:user) { create(:user) }
  let(:wine) { create(:wine) }

  before { login(user) }

  scenario 'ワイン一覧' do
    visit wines_path
    expect(page).to have_content('ワイン一覧')
    expect(page).to have_content('ワイン新規登録')
    expect(page).to have_content('検索する')
  end

  scenario 'ワインの登録' do
    visit new_wine_path
    expect(page).to have_content('ワイン登録')

    fill_in 'wine[name]', with: 'テストワイン'
    # セレクトボックス
    select '赤', from: '色/分類'
    select 'ガメイ', from: '主要品種'
    select 'フランス', from: '国'
    click_on '新規登録'

    expect(current_path).to eq wines_path
    expect(page).to have_content('テストワイン')
  end

  scenario 'ワインの編集' do
    visit edit_wine_path(wine.id)
    expect(page).to have_content(wine.name)

    fill_in 'wine[name]', with: 'テストワイン2'
    # セレクトボックス
    select '白', from: '色/分類'
    select '甲州', from: '主要品種'
    select '日本', from: '国'
    click_on '更新'

    expect(current_path).to eq wines_path
    expect(page).to have_content('テストワイン2')
  end

  scenario 'ワインの削除' do
    visit edit_wine_path(wine.id)

    click_link "このワインを削除する", match: :first
    # モーダル表示
    expect do
      page.accept_confirm "#{wine.name}を削除して良いですか?"
      expect(page).to have_content('ワインの削除')
    end

    expect(page).not_to have_selector 'h4', text: wine.name
    expect(page).to have_content("#{wine.name}を削除しました。")
    expect(current_path).to eq wines_path
  end
end
