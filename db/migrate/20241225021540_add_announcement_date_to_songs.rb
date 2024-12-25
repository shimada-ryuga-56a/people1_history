class AddAnnouncementDateToSongs < ActiveRecord::Migration[8.0]
  def change
    add_column :songs, :announcement_date, :date
  end
end
