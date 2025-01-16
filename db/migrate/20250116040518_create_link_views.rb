class CreateLinkViews < ActiveRecord::Migration[8.0]
  def change
    create_table :link_views do |t|
      t.integer :link_id, null: false
      t.date :date, null: false
      t.integer :record_type, null: false

      t.timestamps
    end
  end
end
