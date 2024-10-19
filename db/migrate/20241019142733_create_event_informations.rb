class CreateEventInformations < ActiveRecord::Migration[7.2]
  def change
    create_table :event_informations do |t|
      t.text :body, null: false
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      
      t.timestamps
    end
  end
end
