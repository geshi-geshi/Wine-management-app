require 'rails_helper'

RSpec.describe Wine, type: :model do
  let(:wine) { create(:wine) }

  it "通常登録できること" do
    expect(wine).to be_valid
  end

  it "それぞれの情報が取得できること" do
    expect(wine.name).to eq "ロマネ・コンティ"
    expect(wine.color).to eq "赤"
    expect(wine.grape_variety).to eq "ピノ・ノワール"
    expect(wine.country).to eq "フランス"
  end

  it "名称が空では登録できない" do
    test_wine = Wine.new(name: "", color: "赤", grape_variety:"ピノ・ノワール", country: "フランス")
    test_wine.valid?
    expect(test_wine).not_to be_valid
    expect(test_wine.errors[:name]).to include("を入力してください")
  end

  it "色が空では登録できない" do
    test_wine = Wine.new(name: "ロマネ・コンティ", color: "", grape_variety:"ピノ・ノワール", country: "フランス")
    test_wine.valid?
    expect(test_wine).not_to be_valid
    expect(test_wine.errors[:color]).to include("を入力してください")
  end

  it "品種が空では登録できない" do
    test_wine = Wine.new(name: "ロマネ・コンティ", color: "赤", grape_variety:"", country: "フランス")
    test_wine.valid?
    expect(test_wine).not_to be_valid
    expect(test_wine.errors[:grape_variety]).to include("を入力してください")
  end

  it "国が空では登録できない" do
    test_wine = Wine.new(name: "ロマネ・コンティ", color: "赤", grape_variety:"ピノ・ノワール", country: "")
    test_wine.valid?
    expect(test_wine).not_to be_valid
    expect(test_wine.errors[:country]).to include("を入力してください")
  end
end
