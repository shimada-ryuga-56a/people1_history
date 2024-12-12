class CreateInformation < ActiveRecord::Migration[8.0]
  def change
    create_table :information do |t|
      t.string :reportable_type, null: false
      t.integer :reportable_id, null: false
      t.string :body, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
