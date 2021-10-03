class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :text
# textカラムをtext型で登録した
      t.references :user, foreign_key: true
      t.references :lunch, foreign_key: true
# 誰が投稿したコメントなのかが大事なので外部キーとしてuserモデルを指定している
# どの投稿に対してコメントをしたのかが大事なので外部キーとしてlunchモデルを指定している
      t.timestamps
    end
  end
end
