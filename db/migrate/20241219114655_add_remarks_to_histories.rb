class AddRemarksToHistories < ActiveRecord::Migration[8.0]
  def change
    add_column :histories, :remark, :text
  end
end
