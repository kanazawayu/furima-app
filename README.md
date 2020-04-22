## usersテーブル
|culumn|type|options|
|------|----|-------|
|nickname|string|null:false
|password|string|null:fals|
|email|string|null:false, unique: true, index:true|

### Association
has_one :profiles
has_one :sending_destination
has_one :credit_cards

## profilesテーブル
|culumn|type|options|
|------|----|-------|
|first_name|string|null:false|
|family_name|string|null:false|
|first_name_kana|string|null:false|
|family_name_kana|string|null:false|
|birth_year|date|null:false|
|birth_month|date|null:false|
|birth_day|date|null:false|
|user_id|references|null: false, foreign_key: true|

### Association
belongs_to :user

## sending_destinationsテーブル #購入者用
|culumn|type|options|
|------|----|-------|
|destination_first_name|string|null: false|
|destination_family_name|string|null: false|
|destination_first_name_kana|string|null: false|
|destination_family_name_kana|string|null: false|
|post_code|integer(7)|null:false|
|prefecture_code|integer|null:false|
|city|string|null:false|
|house_number|string|null:false|
|building_name|string||
|phone_number|integer|unique: true|
|user_id|references|null: false, foreign_key: true|

### Association
belongs_to :user
Gem：ENUMを使用して都道府県コードを取得

## credit_cardsテーブル
|culumn|type|options|
|------|----|-------|
|card_number|integer|null:false, unique: true|
|expiration_year|integer|null:false|
|expiration_month|integer|null:false|
|security_code|integer|null:false|
|user_id|references|null: false, foreign_key: true|

### Association
belongs_to :user