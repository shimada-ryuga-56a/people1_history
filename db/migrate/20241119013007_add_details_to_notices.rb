class AddDetailsToNotices < ActiveRecord::Migration[8.0]
  def change
    add_column :notices, :user_id, :integer
  end
end
