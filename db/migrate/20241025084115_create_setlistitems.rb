class CreateSetlistitems < ActiveRecord::Migration[7.2]
  def change
    create_table :setlistitems do |t|
      t.integer :song_id
      t.text :song_title, null: false
      t.integer :position, null: false
      t.boolean :is_encore, default: false, null: false
      t.boolean :is_song, default: true, null: false
      t.boolean :is_arranged, default: false, null: false

      t.timestamps
    end
  end
end
