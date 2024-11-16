class RenameInformationIdColumnToLikesOnSongInformations < ActiveRecord::Migration[8.0]
  def change
    rename_column :likes_on_song_informations, :information_id, :song_information_id
  end
end
