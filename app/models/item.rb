class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :brand, dependent: :destroy
  has_one :shipment, dependent: :destroy
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :shipment, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :brand, allow_destroy: true
  enum status:{ clean: 0, beauty: 1, dirty: 2}
  enum switch:{ draft: 0, published: 1 }

  # validates :images , presence: true
  # # validates_associated :images
  # # validates_associated :shipment

  # # validates :images, presence: true
  # # validates :shipment, presence: true

  # validates :name, :info, :status, :category_id, :switch, :value, presence: true
end
