# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| last_name_kanji  | string  | null: false | 
| first_name_kanji | string  | null: false | 
| last_name_kana   | string  | null: false |
| first_name_kana  | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| nickname         | string  | null: false |
| birthday         | date    | null: false |

### Association
- has_many :items
- has_many :purchases


## items テーブル
| Column       | Type       | Options                        |
| ------------ | ---------  | ------------------------------ |
| name         | string     | null: false                    | 
| text         | text       | null: false                    |
| price        | integer    | null: false                    |
| category     | integer    | null: false                    |
| condition    | integer    | null: false                    |
| delivery_fee | integer    | null: false                    |
| place        | integer    | null: false                    |
| days         | integer    | null: false                    |
| user_id      | integer    | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :purchase

## purchases テーブル
| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| items_id         | integer    | null: false, foreign_key: true |
| user_id          | integer    | null: false, foreign_key: true |

### Association
- has_one :buyer
- belongs_to :user
- belongs_to :item

## buyers テーブル
| Column           | Type       | Option      |
| ---------------- | ---------- | ----------- |
| postal_code      | string     | null: false |
| prefecture       | integer    | null: false |
| city             | string     | null: false |
| address          | string     | null: false |
| building_name    | string     |             |
| telephone_number | string     | null: false |

## Association
belongs_to :purchase