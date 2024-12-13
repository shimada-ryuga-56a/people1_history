class CreateLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :links do |t|
      t.integer :platform
      t.text :url_link
      t.string :remark

      t.timestamps
    end
  end
end
