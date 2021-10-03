class Lunch < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
# 投稿された給食は複数のコメントを持つことができるのでhas_manyとしている
# lunchテーブルのレコードが削除された時それに投稿されたコメントも削除したいのでdependent: :destroyをつけた
  has_one_attached :image

  validates :staple_food, presence: true
  validates :main_dish, presence: true
  validates :side_dish, presence: true
  validates :soup, presence: true
  validates :drink, presence: true
  validates :other, presence: true
  validates :image, presence: true

end
