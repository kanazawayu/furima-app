FactoryBot.define do

  factory :item do
    name            {"妖怪ウォッチ"}
    info            {"ゲーム"}
    status          {"clean"}
    switch          {"draft"}
    value           {500}
    sold            {"sale"}
    buy_id          {0}
    category_id     {4}
    after(:build) do |item|
      item.images << build(:image)
      item.shipment = build(:shipment)
    end
  end
end
    # user_id         {user.id}
    # images_attributes {build(:image)}
    # shipment_attributes {build(:shipment)}
    # category_id     {1}

    # association :images,
    # factory: :images,
    # strategy: :build
    # # admin: true   

    # association :shipment,
    # factory: :shipment,
    # strategy: :build
    # admin: true   
    

  # factory :images, class: Item do
  #   image=              "1.png"
  # end

  # factory :shipment, class: Item do
  #   delivery_burden=    0
  #   days=               0
  #   prefecture_id=      0
  # end