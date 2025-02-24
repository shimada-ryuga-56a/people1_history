class CreateLinkViewCounts < ActiveRecord::Migration[8.0]
  def change
    create_table :link_view_counts do |t|
      t.integer :link_id, null: false
      t.date :date, null: false
      t.integer :view_count, null: false

      t.timestamps
    end
  end
end
