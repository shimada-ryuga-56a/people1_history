class ChangeAnnoucementDateToNotNull < ActiveRecord::Migration[8.0]
  def change
    change_column_null :discs, :announcement_date, true
  end
end
