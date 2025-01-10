class CreateTieUps < ActiveRecord::Migration[8.0]
  def change
    create_table :tie_ups do |t|
      t.string :collaboration_title, null: false
      t.integer :song_id, null: false
      t.date :announce_date, null: false
      t.text :remark

      t.timestamps
    end
  end
end
