class CreateSetlistitemInformations < ActiveRecord::Migration[7.2]
  def change
    create_table :setlistitem_informations do |t|
      t.integer :user_id, null: false
      t.integer :setlistitem_id, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
