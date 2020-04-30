class Brand < ApplicationRecord
  belongs_to :item, optional: true
end
