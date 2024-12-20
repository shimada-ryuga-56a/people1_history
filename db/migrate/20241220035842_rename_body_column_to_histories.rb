class RenameBodyColumnToHistories < ActiveRecord::Migration[8.0]
  def change
    rename_column :histories, :body, :title
  end
end
