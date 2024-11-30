class CreateDiscVersions < ActiveRecord::Migration[8.0]
  def change
    create_table :disc_versions do |t|
      t.integer :disc_id, null: false
      t.integer :version, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
