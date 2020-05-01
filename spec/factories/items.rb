FactoryBot.define do

  factory :item do

    id              {1}
    name            {"妖怪ウォッチ"}
    info            {"ゲーム"}
    status          {0}
    # category_id     {1}
    switch          {0}
    value           {500}
    sold            {0}

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