## Usersテーブル

|Column             |Type         |Options                  |
|-------------------|-------------|-------------------------|
|nickname           |string       |null: false              |
|email              |string       |null: false, unique: true|
|encrypted_password |string       |null: false              |
|first_name         |string       |null: false| 
|last_name          |string       |null: false|
|first_kana         |string       |null: false| 
|last_kana          |string       |null: false|
|birth_year         |integer      |null: false|
|birth_month        |integer      |null: false|
|birth_day          |integer      |null: false|


### Association
-has_many :items


## itemsテーブル

|Column             |Type         |Options                  |
|-------------------|-------------|-------------------------|
|image              |string       |null: false              |
|name               |string       |null: false, unique: true|
|description        |string       |null: false              |
|category           |string       |null: false| 
|condition          |string       |null: false|
|shipping_fee       |string	      |null: false|
|prefecture         |string	      |null: false|
|ship_days          |string	      |null: false|
|price              |integer	    |null: false|
|user_id            |references	  |null: false, foreign_key: true|



### Association
-belongs_to :user
-has_one :purchase

## Purchaserテーブル

|Column	      |Type	     |Options
|card_number	|string	   |null: false
|expiry_date	|string	   |null: false
|security_code|string	   |null: false
|postal_code	|string	   |null: false
|prefecture	  |string	   |null: false
|city	        |string	   |null: false
|address	    |string	   |null: false
|building_name|string	   |
|phone_number	|string	   |null: false
|user_id	    |references|null: false, foreign_key: true
|product_id	  |references|null: false, foreign_key: true


### Association

-belongs_to :user
-belongs_to :product

