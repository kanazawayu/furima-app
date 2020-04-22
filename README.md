## usersテーブル
|culumn|type|options|
|------|----|-------|
|nickname|string|null:false
|password|string|null:fals|
|email|string|null:false, unique: true, index:true|

### Association
- has_one :profiles
- has_one :sending_destination
- has_one :credit_cards

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
- belongs_to :user

## destinationsテーブル
|culumn|type|options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|post_code|integer(7)|null:false|
|prefecture_code|integer|null:false|default,0
|city|string|null:false|
|house_number|string|null:false|
|building_name|string||
|phone_number|integer|unique: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
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
- belongs_to :user

###### 商品出品

## Product Model
|Column|Type|options|
|:----:|:--:|:-----:|
|name|string|null: false|
|info|text|null: false|
|category|integer|null: false|default: 0|
|brand|string|
|status|integer|null: false|default: 0|
|delivery burden|integer|null: false|default: 0|
|prefecture|integer|null: false|default: 0|
|days|integer|null: false|default: 0|
|value|integer|null: false|
|fee|integer|null: false|
|return|integer|null: false|
|user_id|integer|foreign_key: true|
|exhibit_id|integer|
|draft_id|integer|
|negotiate_id|integer|

### Assosiation 
- has_many :photos
- has_many :likes
- belongs_to :user

## Photo Model
|Column|Type|options|
|:----:|:--:|:-----:|
|photo|string|null: false|
|product_id|string|foreign_key: true|

### Assosiation 
- belongs_to :product

## Exhibit Model
|Column|Type|options|
|:----:|:--:|:-----:|

### Assosiation 
- has_one :product
- belongs_to :user
- accepts_nested_attributes_for :product

## Draft Model
|Column|Type|options|
|:----:|:--:|:-----:|

### Assosiation 
- has_one :product
- belongs_to :user
- accepts_nested_attributes_for :product

## Negotiate Model
|Column|Type|options|
|:----:|:--:|:-----:|

### Assosiation 
- has_one :product
- belongs_to :user
- accepts_nested_attributes_for :product

## Sold Model
|Column|Type|options|
|:----:|:--:|:-----:|

### Assosiation 
- has_one :product
- belongs_to :user
- accepts_nested_attributes_for :product