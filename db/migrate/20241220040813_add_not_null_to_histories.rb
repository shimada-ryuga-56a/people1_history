class AddNotNullToHistories < ActiveRecord::Migration[8.0]
  def change
    change_column_null :histories, :remark, false
  end
end
