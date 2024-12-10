class CreateEventBookmarks < ActiveRecord::Migration[8.0]
  def change
    create_table :event_bookmarks do |t|
      t.integer :event_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
