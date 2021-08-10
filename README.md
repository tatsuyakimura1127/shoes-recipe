## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| name               | string              | null: false             |
| profile            | text                | null: false             |
| profession         | text                | null: false             |
| size               | integer             |                         |

### Association

* has_many :recipes
* has_many :comments

## recipes table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| title                               | string     | null: false       |
| cream                               | text       | null: false       |
| procedure                           | text       | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| recipe      | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :recipe
- belongs_to :user