class Address < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :family_name
    validates :first_name
    validates :family_name_kana
    validates :first_name_kana
    validates :address_number
    validates :prefecture_id
    validates :street_number
    validates :street_number
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
