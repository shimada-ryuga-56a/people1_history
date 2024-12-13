class CreateLinkContents < ActiveRecord::Migration[8.0]
  def change
    create_table :link_contents do |t|
      t.integer :link_id, null: false
      t.belongs_to :linkable, polymorphic: true

      t.timestamps
    end
  end
end
