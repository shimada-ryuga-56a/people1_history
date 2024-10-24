class CreateLikesOnEventInformations < ActiveRecord::Migration[7.2]
  def change
    create_table :likes_on_event_informations do |t|
      t.integer :user_id
      t.integer :event_information_id

      t.timestamps
    end
  end
end
