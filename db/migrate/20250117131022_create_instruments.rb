class CreateInstruments < ActiveRecord::Migration[8.0]
  def change
    create_table :instruments do |t|
      t.integer :member_id, null: false
      t.integer :name, null: false

      t.timestamps
    end
  end
end
