class CreateSetlists < ActiveRecord::Migration[7.2]
  def change
    create_table :setlists do |t|
      t.integer :event_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
