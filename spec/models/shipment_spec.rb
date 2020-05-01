require 'rails_helper'
describe Shipment do
  describe '#create' do

    it "delivery_burdenがない場合は登録できないこと" do
     shipment = build(:shipment, delivery_burden: nil)
     shipment.valid?
     expect(shipment.errors[:delivery_burden]).to include("can't be blank")
    end

    it "daysがない場合は登録できないこと" do
      shipment = build(:shipment, days: nil)
      shipment.valid?
      expect(shipment.errors[:days]).to include("can't be blank")
    end

    it "prefecture_idがない場合は登録できないこと" do
      shipment = build(:shipment, prefecture_id: nil)
      shipment.valid?
      expect(shipment.errors[:prefecture_id]).to include("can't be blank")
    end

    it "全部あれば登録できること" do
      shipment = build(:shipment)
      shipment.valid?
      expect(shipment).to be_valid
    end

  end
end