class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :brand, dependent: :destroy
  has_one :shipment, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :comments 
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  accepts_nested_attributes_for :shipment, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :brand, allow_destroy: true
  enum status:{ clean: 1, beauty: 2, dirty: 3}
  enum switch:{ draft: 1, published: 2 }
  enum sold:{ sale: 1, out: 2 }

  belongs_to :buy, optional: true

  validates_associated :images
  validates_associated :shipment

  validates :images, presence: true
  validates :shipment, presence: true

  validates :name, presence: true, length: { in: 1..20 }
  validates :info, presence: true, length: { in: 1..1000 }
  validates :value, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :status, :category_id, :switch, :sold, presence: true

  def self.search(search)
    return Item.all unless search
    Item.where('name LIKE(?)', "%#{search}%")
  end
end
