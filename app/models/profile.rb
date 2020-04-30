class Profile < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :family_name
    validates :first_name
    validates :family_name_kana
    validates :first_name_kana
    validates :birth_year
    validates :birth_month
    validates :birth_day
  end
  
end
