## テーブル
# usersテーブル
  - username :string, index: true
  - group_id :references, foreign_key: true

# groupsテーブル
  - name :string

# tweetsテーブル
  - tweet :text
  - image :text

# user_groupsテーブル
  - user_id :references  foreign_key true
  - group_id :references  foreign_key true


## アソシエーション

# users
- has_many groups through: :user_groups
- has_many tweets

# tweets
- belongs_to user

# groups
- has_many users through: :user_groups
