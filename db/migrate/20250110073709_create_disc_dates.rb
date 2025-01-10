class CreateDiscDates < ActiveRecord::Migration[8.0]
  def change
    create_table :disc_dates do |t|
      t.date :date, null: false
      t.integer :disc_id, null: false
      t.integer :date_type, null: false
      t.text :remark

      t.timestamps
    end
  end
end
