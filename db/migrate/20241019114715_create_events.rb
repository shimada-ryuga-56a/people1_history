class CreateEvents < ActiveRecord::Migration[7.2]
  def change
    create_table :events do |t|
      t.integer :category
      t.text :name
      t.text :name_kana_ruby
      t.date :date
      t.text :place
      t.integer :place_prefecture
      t.boolean :is_canceled
      t.integer :tour_id
      t.text :remark

      t.timestamps
    end
  end
end
