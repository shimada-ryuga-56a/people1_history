class CreateLikesOnInformations < ActiveRecord::Migration[8.0]
  def change
    create_table :likes_on_informations do |t|
      t.integer :information_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
