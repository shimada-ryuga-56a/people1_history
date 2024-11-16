class CreateLikesOnSetlistitemInformations < ActiveRecord::Migration[8.0]
  def change
    create_table :likes_on_setlistitem_informations do |t|
      t.integer :setlistitem_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
