class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :brand
  has_one :shipment
  has_many :images
  accepts_nested_attributes_for :shipment, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :brand, allow_destroy: true
  # enum status:{ new: 0, beauty: 1, dirty: 2}
  enum switch:{ draft: 0, published: 1 }

end
