class ChangeColumnNullOnDiscs < ActiveRecord::Migration[8.0]
  def change
    change_column_null :discs, :release_date, false
  end
end
