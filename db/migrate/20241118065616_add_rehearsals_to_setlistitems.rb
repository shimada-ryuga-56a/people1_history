class AddRehearsalsToSetlistitems < ActiveRecord::Migration[8.0]
  def change
    add_column :setlistitems, :is_rehearsal, :boolean, null: false, default: false
  end
end
