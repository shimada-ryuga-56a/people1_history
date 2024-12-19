class CreateHistories < ActiveRecord::Migration[8.0]
  def change
    create_table :histories do |t|
      t.text :body, null: false
      t.integer :user_id, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
