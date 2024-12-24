class ChangeHistoryColumnToNull < ActiveRecord::Migration[8.0]
  def change
    change_column_null :histories, :remark, true
  end
end
