require 'rails_helper'
describe Item do
  describe '#create' do

    it "nameがない場合は登録できないこと" do
     item = build(:item, name: nil)
     item.valid?
     expect(item.errors[:name]).to include("can't be blank")
    end

    it "infoがない場合は登録できないこと" do
      item = build(:item, info: nil)
      item.valid?
      expect(item.errors[:info]).to include("can't be blank")
    end
    
    it "statusがない場合は登録できないこと" do
      item = build(:item, status: nil)
      item.valid?
      expect(item.errors[:status]).to include("can't be blank")
    end

    it "category_idがない場合は登録できないこと" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "switchがない場合は登録できないこと" do
      item = build(:item, switch: nil)
      item.valid?
      expect(item.errors[:switch]).to include("can't be blank")
    end

    it "valueがない場合は登録できないこと" do
      item = build(:item, value: nil)
      item.valid?
      expect(item.errors[:value]).to include("can't be blank")
    end

    it "soldがない場合は登録できないこと" do
      item = build(:item, sold: nil)
      item.valid?
      expect(item.errors[:sold]).to include("can't be blank")
    end

    it "全部あれば登録できること" do
      user = create(:user)
      category = create(:category)
      item = build(:item, user_id: user.id, category_id: category.id)
      item.valid?
      expect(item).to be_valid
    end

    it "nameが41文字以上だと登録できない事" do
      item = build(:item, name: "aqwsxzaqwsxzaqwsxzaqwsxzaqwsxzaqwsxzaqwsx")
      item.valid?
      expect(item.errors[:name]).to include("is too long (maximum is 40 characters)")
    end

    it "valueが299円以下だと登録できないこと" do
      item = build(:item, value: 299)
      item.valid?
      expect(item.errors[:value]).to include("must be greater than or equal to 300")
    end

    it "valueが9999999円より高い場合登録できないこと" do
      item = build(:item, value: 10000000)
      item.valid?
      expect(item.errors[:value]).to include("must be less than or equal to 9999999")
    end

  end
end