class CreateGears < ActiveRecord::Migration[8.0]
  def change
    create_table :gears do |t|
      t.integer :instrument_id, null: false
      t.string :name, null: false
      t.text :remark

      t.timestamps
    end
  end
end
