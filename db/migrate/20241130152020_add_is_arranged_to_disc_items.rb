class AddIsArrangedToDiscItems < ActiveRecord::Migration[8.0]
  def change
    add_column :disc_items, :is_arranged, :boolean, default: false, null: false
  end
end
