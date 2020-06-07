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
    test_wine = Wine.new(name: "", color: "赤", grape_variety: "ピノ・ノワール", country: "フランス")
    test_wine.valid?
    expect(test_wine).not_to be_valid
    expect(test_wine.errors[:name]).to include("を入力してください")
  end

  it "名称が101文字以上では登録できない" do
    testName = "a" * 101
    test_wine = Wine.new(name: testName, color: "赤", grape_variety: "ピノ・ノワール", country: "フランス")
    test_wine.valid?
    expect(test_wine).not_to be_valid
    expect(test_wine.errors[:name]).to include("は100文字以内で入力してください")
  end

  it "色が空では登録できない" do
    test_wine = Wine.new(name: "ロマネ・コンティ", color: "", grape_variety: "ピノ・ノワール", country: "フランス")
    test_wine.valid?
    expect(test_wine).not_to be_valid
    expect(test_wine.errors[:color]).to include("を入力してください")
  end

  it "品種が空では登録できない" do
    test_wine = Wine.new(name: "ロマネ・コンティ", color: "赤", grape_variety: "", country: "フランス")
    test_wine.valid?
    expect(test_wine).not_to be_valid
    expect(test_wine.errors[:grape_variety]).to include("を入力してください")
  end

  it "国が空では登録できない" do
    test_wine = Wine.new(name: "ロマネ・コンティ", color: "赤", grape_variety: "ピノ・ノワール", country: "")
    test_wine.valid?
    expect(test_wine).not_to be_valid
    expect(test_wine.errors[:country]).to include("を入力してください")
  end

  it "regionが51文字以上では登録できない" do
    testRegion = "あ" * 51
    test_wine = Wine.new(name: "ロマネ・コンティ", color: "赤", grape_variety: "ピノ・ノワール", country: "フランス", region: testRegion)
    test_wine.valid?
    expect(test_wine).not_to be_valid
    expect(test_wine.errors[:region]).to include("は50文字以内で入力してください")
  end

  it "areaが51文字以上では登録できない" do
    testArea = "あ" * 51
    test_wine = Wine.new(name: "ロマネ・コンティ", color: "赤", grape_variety: "ピノ・ノワール", country: "フランス", area: testArea)
    test_wine.valid?
    expect(test_wine).not_to be_valid
    expect(test_wine.errors[:area]).to include("は50文字以内で入力してください")
  end

  it "producerが101文字以上では登録できない" do
    testProducer = "あ" * 101
    test_wine = Wine.new(name: "ロマネ・コンティ", color: "赤", grape_variety: "ピノ・ノワール", country: "フランス", producer: testProducer)
    test_wine.valid?
    expect(test_wine).not_to be_valid
    expect(test_wine.errors[:producer]).to include("は100文字以内で入力してください")
  end

  it "appearanceが201文字以上では登録できない" do
    testAppearance = "あ" * 201
    test_wine = Wine.new(name: "ロマネ・コンティ", color: "赤", grape_variety: "ピノ・ノワール", country: "フランス", appearance: testAppearance)
    test_wine.valid?
    expect(test_wine).not_to be_valid
    expect(test_wine.errors[:appearance]).to include("は200文字以内で入力してください")
  end

  it "aromaが201文字以上では登録できない" do
    testAroma = "あ" * 201
    test_wine = Wine.new(name: "ロマネ・コンティ", color: "赤", grape_variety: "ピノ・ノワール", country: "フランス", aroma: testAroma)
    test_wine.valid?
    expect(test_wine).not_to be_valid
    expect(test_wine.errors[:aroma]).to include("は200文字以内で入力してください")
  end

  it "tasteが201文字以上では登録できない" do
    testTaste = "あ" * 201
    test_wine = Wine.new(name: "ロマネ・コンティ", color: "赤", grape_variety: "ピノ・ノワール", country: "フランス", taste: testTaste)
    test_wine.valid?
    expect(test_wine).not_to be_valid
    expect(test_wine.errors[:taste]).to include("は200文字以内で入力してください")
  end

  it "production_yearが4文字以上では登録できない" do
    test_wine = Wine.new(name: "ロマネ・コンティ", color: "赤", grape_variety: "ピノ・ノワール", country: "フランス", production_year: "123456")
    test_wine.valid?
    expect(test_wine).not_to be_valid
    expect(test_wine.errors[:production_year]).to include("は4文字以内で入力してください")
  end
end
