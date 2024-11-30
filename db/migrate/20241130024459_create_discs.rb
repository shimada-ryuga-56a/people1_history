class CreateDiscs < ActiveRecord::Migration[8.0]
  def change
    create_table :discs do |t|
      t.string :title, null: false
      t.string :title_ruby, null: false
      t.date :announcement_date, null: false
      t.date :release_date
      t.integer :type, null: false

      t.timestamps
    end
  end
end
