class Shipment < ApplicationRecord
  belongs_to :item, optional: true
  enum delivery_burden:{ my: 1, you: 2 }
  enum days:{ fast: 1, normal: 2, late: 3 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
