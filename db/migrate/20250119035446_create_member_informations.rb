class CreateMemberInformations < ActiveRecord::Migration[8.0]
  def change
    create_table :member_informations do |t|
      t.integer :user_id, null: false
      t.integer :member_id, null: false

      t.timestamps
    end
  end
end
