class ChangeReleaseDateColumnToNull < ActiveRecord::Migration[8.0]
  def up
    change_column_null :discs, :release_date, true
  end
end
