class RenameAnnounceDateColumnToTieUps < ActiveRecord::Migration[8.0]
  def change
    rename_column :tie_ups, :announce_date, :announcement_date
  end
end
