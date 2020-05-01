class Shipment < ApplicationRecord
  belongs_to :item, optional: true
  enum delivery_burden:{ my: 0, you: 1 }
  enum days:{ fast: 0, normal: 1, late: 2 }

  with_options presence: true do
    validates :delivery_burden
    validates :days
    validates :prefecture_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
