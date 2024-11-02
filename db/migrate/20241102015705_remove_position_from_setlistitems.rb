class RemovePositionFromSetlistitems < ActiveRecord::Migration[7.2]
  def change
    remove_column :setlistitems, :position, :integer
  end
end
