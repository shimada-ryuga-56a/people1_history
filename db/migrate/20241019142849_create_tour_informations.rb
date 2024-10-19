class CreateTourInformations < ActiveRecord::Migration[7.2]
  def change
    create_table :tour_informations do |t|
      t.text :body, null: false
      t.references :user, foreign_key: true
      t.references :tour, foreign_key: true
      
      t.timestamps
    end
  end
end
