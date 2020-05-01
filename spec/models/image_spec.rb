require 'rails_helper'
describe Image do
  describe '#create' do

    it "imageがない場合は登録できないこと" do
     image = build(:image, image: nil)
     image.valid?
     expect(image.errors[:image]).to include("can't be blank")
    end

    it "全部あれば登録できること" do
      image = build(:image)
      image.valid?
      expect(image).to be_valid
    end

  end
end