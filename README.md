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

アプリ名：MovieRank28800

アプリケーション概要：ユーザーの新規登録・ログイン/ログアウト、映画の投稿、映画の詳細確認

URL:https://movierank28800.herokuapp.com/

Basic認証ID:techmaster
Basic認証PW:2020

テスト用アカウント emmail:test@test.com 、 password:a12345

利用方法：ユーザーは映画の投稿、コメント、いいねができる。いいねの数でランキング形式になっており、人気の映画を知ることができる。また映画へのコメントで他のユーザーとの交流ができる。

目指した課題解決：主に10代〜40代の男性がターゲット。好きな映画について他のユーザーと交流ができるようにすること。

実装予定の機能：出演俳優の検索

データベース設計：https://app.diagrams.net/#G1P1FQslMsj9AS2Wh3wQ95FLOqoTZdHe3G

ローカルでの動作方法：git clone https://movierank28800.herokuapp.com/.git
                  cd movierank28800
                  bundle install
                  rails db:create
                  rails db:migrate
                  rails s
                  http://localhost:3000







## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |

### Association

- has_many :movie
- has_many :likes
- has_many :liked_movies
- has_many :commments

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
- has_many :comments

## likes テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| movie   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :movie

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| movie   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :movie