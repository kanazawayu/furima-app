FactoryBot.define do

  factory :item do

    id              {1}
    name            {"妖怪ウォッチ"}
    info            {"ゲーム"}
    status          {"clean"}
    switch          {"draft"}
    value           {500}
    sold            {"sale"}
    # category_id     {1}

    # association :images,
    # factory: :images,
    # strategy: :build
    # # admin: true   

    # association :shipment,
    # factory: :shipment,
    # strategy: :build
    # admin: true   
    
  end

  # factory :images, class: Item do
  #   image=              "1.png"
  # end

  # factory :shipment, class: Item do
  #   delivery_burden=    0
  #   days=               0
  #   prefecture_id=      0
  # end
end