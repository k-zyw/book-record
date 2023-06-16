# アプリケーション名
 book-record

# アプリケーションの概要
 読み終えた本の内容を記録できるようにする。

# URL
 https://book-record-zbm4.onrender.com/

 # テスト用アカウント
 ・テストメールアドレス1：bbb@bbb

 ・パスワード1：bbbbbb

 ・テストメールアドレス2：ccc@ccc

 ・パスワード2：cccccc

 ・Basic認証ID:admin

 ・Basic認証パスワード:2222

# 利用方法
## 読み終えた本の投稿
1.トップページ（一覧ページ）のヘッダーからユーザー新規登録を行う

2.新規投稿ページから目標の内容を入力し投稿する。

# アプリケーションを作成した背景
 読み終えた本の内容は数か月したら忘れてしまう傾向にあるのでその本の内容を記録しておける場がほしかった。

 また、同じ趣味を持つ人とコミュニケーション取るためコメント機能実装し他の人のおすすめの本を教えてもらい自分の読書の幅を広げる。

# テーブル設計

## ER図
[![Image from Gyazo](https://i.gyazo.com/a41b9ec0d0d2e6abb4d98af74ec0d7b3.png)](https://gyazo.com/a41b9ec0d0d2e6abb4d98af74ec0d7b3)

## users テーブル

| Column              | Type   | Options                   |
| ------------------  | ------ | ------------------------- |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| name                | string | null: false               |

### Association

- has_many :books
- has_many :comments



## books テーブル

| Column      | Type      | Options                        |
| ----------- | --------- | -----------                    |
| category_id | integer   | null: false                    |
| title       | string    | null: false                    |
| author      | string    | null: false                    |(著者)
| description | text      | null: false                    |(内容)
| user        | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments



## comments テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| book      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :book

# 画面遷移

[![Image from Gyazo](https://i.gyazo.com/95df1790d2aa5cd8c0428efebf5e2bb9.png)](https://gyazo.com/95df1790d2aa5cd8c0428efebf5e2bb9)

# 開発環境
Ruby/Ruby on Rails/MySQL/Github/Visual Studio Code


