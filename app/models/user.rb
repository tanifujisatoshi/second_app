class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lunches
  has_many :comments
# ユーザーは複数の投稿をすることができ複数のコメントを残すことができるのでhas_manyを使ってアソシエーションを表している

  validates :name, presence: true
end
