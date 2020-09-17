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
| birthday         | integer | null: false |

### Association
- has_many :items
- has_one :purchases

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
| user_id      | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one :purchases

## purchases テーブル
| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | integer    | null: false                    |
| prefecture       | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | integer    | null: false                    |
| items_id         | references | null: false, foreign_key: true |
| user_id          | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
