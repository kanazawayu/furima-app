class Card < ApplicationRecord
  belongs_to :user
  validates :number, presence: true, uniqueness: true, length: { in: 14..16 } 
  validates :code,    length: { in: 3..4 } 
end
