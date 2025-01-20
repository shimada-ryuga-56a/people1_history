class CreateLikesOnMemberInfos < ActiveRecord::Migration[8.0]
  def change
    create_table :likes_on_member_infos do |t|
      t.integer :member_information_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
