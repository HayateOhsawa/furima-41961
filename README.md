## Usersテーブル

|Column             |Type         |Options                  |
|-------------------|-------------|-------------------------|
|nickname           |string       |null: false              |
|email              |string       |null: false, unique: true|
|encrypted_password |string       |null: false              |
|last_name          |string       |null: false              |
|first_kana         |string       |null: false              | 
|last_kana          |string       |null: false              |
|birth_date         |date         |null: false              |
|first_name         |string       |null: false              | 


### Association
- has_many :items
- has_many :orders

## itemsテーブル

|Column             |Type         |Options                       |
|-------------------|-------------|------------------------------|
|name               |string       |null: false                   |
|description        |text         |null: false                   |
|category_id        |integer      |null: false                   | 
|condition_id       |integer      |null: false                   |
|shipping_fee_id    |integer	    |null: false                   |
|prefecture_id      |integer	    |null: false                   |
|ship_day_id        |integer      |null: false                   |
|price              |integer	    |null: false                   |
|user               |references	  |null: false, foreign_key: true|



### Association
- belongs_to :user
- has_one :purchase_record

## addressesテーブル

|Column	          |Type	     |Options|
|-----------------|----------|-------|
|postal_code	    |string	   |null: false|
|prefecture_id    |integer   |null: false|
|city	            |string	   |null: false|
|address	        |string	   |null: false|
|building_name    |string	   ||
|phone_number	    |string	   |null: false|
|order            |references|null: false, foreign_key: true|


### Association
- belongs_to :order

## Ordersテーブル
|Column	      |Type	     |Options|
|-------------|----------|-------|
|user 	      |references|null: false, foreign_key: true|
|item 	      |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

