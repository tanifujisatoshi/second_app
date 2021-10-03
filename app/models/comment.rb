class Comment < ApplicationRecord
  belongs_to :lunch
# コメントは一つの投稿に紐づいているのでbelongs_toを使ってcommentモデルとlunchモデルのアソシエーションを表している
  belongs_to :user
# コメントは一人のユーザーに紐づいているのでbelongs_toを使ってcommentモデルとuserモデルのアソシエーションを表している
  validates :text, presence: true
end
