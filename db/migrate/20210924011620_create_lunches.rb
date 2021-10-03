class CreateLunches < ActiveRecord::Migration[6.0]
  def change
    create_table :lunches do |t|
      t.string :staple_food, null: false
      t.string :main_dish,   null: false
      t.string :side_dish,   null: false
      t.string :soup,        null: false
      t.string :drink,       null: false
      t.string :other,       null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
