class CreateDiscItems < ActiveRecord::Migration[8.0]
  def change
    create_table :disc_items do |t|
      t.integer :disc_content_id, null: false
      t.integer :position, null: false
      t.integer :song_id
      t.string :title

      t.timestamps
    end
  end
end
