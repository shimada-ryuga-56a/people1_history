class CreateSongInformations < ActiveRecord::Migration[7.2]
  def change
    create_table :song_informations do |t|
      t.integer :song_id, null: false
      t.integer :user_id, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
