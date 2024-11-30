class AddDetailsToDiscContents < ActiveRecord::Migration[8.0]
  def change
    add_column :disc_contents, :event_id, :integer
  end
end
