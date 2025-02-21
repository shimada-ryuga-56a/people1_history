class CreateInformation < ActiveRecord::Migration[8.0]
  def change
    create_table :information do |t|
      t.belongs_to :reportable, polymorphic: true
      t.string :body, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
