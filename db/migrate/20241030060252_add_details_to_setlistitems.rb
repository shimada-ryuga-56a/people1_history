class AddDetailsToSetlistitems < ActiveRecord::Migration[7.2]
  def change
    add_column :setlistitems, :setlist_id, :integer
  end
end
