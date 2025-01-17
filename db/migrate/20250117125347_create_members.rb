class CreateMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.string :name_ruby, null: false
      t.text :x_link
      t.text :instagram
      t.text :thread
      t.integer :role, null: false
      t.integer :birthday_year
      t.integer :birthday_month
      t.integer :birthday_day
      t.integer :blood_type
      t.integer :mbti
      t.text :birth_place

      t.timestamps
    end
  end
end
