#usersテーブル　ユーザー情報

|colmn|type|options|
|nickname|string|null:false|
|email|string|null:false|
|passward|string|null:false|

#アソシエーション

has_one profile
has_one sending_destination
has_one credit_card

#profilesテーブル　本人確認

|colmn|type|options|
|family_name|string|null:false|
|first_name|string|null:false|
|family_name_kana|string|null:false|
|first_name_kana|string|null:false|
|birth_year|date|null:false|
|birth_month|date|null:false|
|birth_day|date|null:false|
|user|references|null:false,foreign_key:true|

#アソシエーション

belongs_to user

#sending_destinationsテーブル　送付先住所情報

|colmn|type|options|
|destination_family_name|string|null:false|
|destination_first_name|string|null:false|
|destination_family_name_kana|string|null:false|
|destination_first_name_kana|string|null:false|
|prefecture|string|null:false|
|phone_number|integer|null:false|
|room_number|integer|null:false|
|building_name|string|null:false|
|user|references|null:false,foreign_key:true|

#アソシエーション

belongs_to user

#credit_cards テーブル

|colmn|type|options|null:false,unique:true|
|card_number|integer|null:false|
|expiration_year|integer|null:false|
|expiration_month|integer|null:false|
|security_code|integer|null:false|
|user|references|null:false,foreign_key:true|

#アソシエーション

belongs_to user

