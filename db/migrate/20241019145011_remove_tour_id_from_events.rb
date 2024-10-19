class RemoveTourIdFromEvents < ActiveRecord::Migration[7.2]
  def change
    remove_column :events, :tour_id, :integer
  end
end
