class CreateLikesOnTourInformations < ActiveRecord::Migration[7.2]
  def change
    create_table :likes_on_tour_informations do |t|
      t.integer :user_id
      t.integer :tour_information_id

      t.timestamps
    end
  end
end
