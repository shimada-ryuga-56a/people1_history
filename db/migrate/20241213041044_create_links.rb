class CreateLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :links do |t|
      t.integer :platform, null: false
      t.text :url_link, null: false
      t.string :remark, null: false

      t.timestamps
    end
  end
end
