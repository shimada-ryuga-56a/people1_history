class CreateLikesOnSongInformations < ActiveRecord::Migration[7.2]
  def change
    create_table :likes_on_song_informations do |t|
      t.integer :information_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
