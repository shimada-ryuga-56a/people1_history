class RenameUserIdColumnToNotices < ActiveRecord::Migration[8.0]
  def change
    rename_column :notices, :user_id, :from_whom_id
  end
end
