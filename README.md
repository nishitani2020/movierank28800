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

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |

### Association

- has_many :movie
- has_many :likes
- has_many :liked_movies

## movies テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| image            | text       | null:false                     |
| name             | string     | null:false                     |
| explanation      | text       | null:false                     |
| category_id      | integer    | null:false                     |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :likes
- has_many :liked_users

## likes テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| movie   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :movie