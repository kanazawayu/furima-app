FactoryBot.define do

  factory :image do

    id         {1}
    image      {File.open("#{Rails.root}/public/images/test_image.jpg")}
    
  end
  
end