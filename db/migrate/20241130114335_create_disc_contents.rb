class CreateDiscContents < ActiveRecord::Migration[8.0]
  def change
    create_table :disc_contents do |t|
      t.integer :disc_version_id, null: false
      t.integer :content_type, null: false

      t.timestamps
    end
  end
end
