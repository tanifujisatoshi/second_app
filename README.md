## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| password           | string | null: false |
| name               | string | null: false |

### Association

- has_many :lunches
- has_many :comments

## lunches テーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| staple_food        | string    | null: false |
| main_dish          | string    | null: false |
| side_dish          | string    | null: false |
| soup               | string    | null: false |
| drink              | string    | null: false |
| other              | string    | null: false |
| image              |           |             |
| user               | references|             |

### Association

- has_many :comments
- belongs_to :user
 
## comments テーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| text               | text      | null: false |
| user               | references|             |
| lunch              | references|             |



### Association

- belongs_to :lunch
- belongs_to :user
