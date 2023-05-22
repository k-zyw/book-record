# README


# テーブル設計

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
