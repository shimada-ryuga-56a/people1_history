class AddIsCanceledToEvents < ActiveRecord::Migration[7.2]
  def change
    add_column :events, :is_canceled, :boolean, default: false, null: false
  end
end
