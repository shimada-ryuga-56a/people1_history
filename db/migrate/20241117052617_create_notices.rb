class CreateNotices < ActiveRecord::Migration[8.0]
  def change
    create_table :notices do |t|
      t.integer :user_id
      t.references :noticeable, polymorphic: true
      t.integer :action_type, null: false
      t.boolean :unread, null: false, default: true

      t.timestamps
    end
  end
end
