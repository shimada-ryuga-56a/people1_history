class RemoveIsCanceledFromEvents < ActiveRecord::Migration[7.2]
  def change
    remove_column :events, :is_canceled, :boolean
  end
end
