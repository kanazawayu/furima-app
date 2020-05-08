class Profile < ApplicationRecord
  belongs_to :user, optional: true

  enum birth_year:{ yearone: 1, yeartwo: 2, yearthree: 3}
  enum birth_month:{ monthone: 1, monthtwo: 2, monththree: 3}
  enum birth_day:{ dayone: 1, daytwo: 2, daythree: 3}

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
