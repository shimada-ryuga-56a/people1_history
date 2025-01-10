class AddIsNewSongToTieUps < ActiveRecord::Migration[8.0]
  def change
    add_column :tie_ups, :is_new_song, :boolean, default: true, null: false
  end
end
