require 'rails_helper'
describe Profile do
  describe '#create' do

    it "family_nameがない場合は登録できないこと" do
     profile = build(:profile, family_name: nil)
     profile.valid?
     expect(profile.errors[:family_name]).to include("can't be blank")
    end

    it "first_nameがない場合は登録できないこと" do
      profile = build(:profile, first_name: nil)
      profile.valid?
      expect(profile.errors[:first_name]).to include("can't be blank")
    end
    
    it "family_name_kanaがない場合は登録できないこと" do
      profile = build(:profile, family_name_kana: nil)
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("can't be blank")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      profile = build(:profile, first_name_kana: nil)
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("can't be blank")
    end

    it "birth_yearがない場合は登録できないこと" do
      profile = build(:profile, birth_year: nil)
      profile.valid?
      expect(profile.errors[:birth_year]).to include("can't be blank")
    end

    it "birth_monthがない場合は登録できないこと" do
      profile = build(:profile, birth_month: nil)
      profile.valid?
      expect(profile.errors[:birth_month]).to include("can't be blank")
    end

    it "birth_dayがない場合は登録できないこと" do
      profile = build(:profile, birth_day: nil)
      profile.valid?
      expect(profile.errors[:birth_day]).to include("can't be blank")
    end

    it "全部あれば登録できること" do
      profile = build(:profile)
      profile.valid?
      expect(profile).to be_valid
    end

  end
end