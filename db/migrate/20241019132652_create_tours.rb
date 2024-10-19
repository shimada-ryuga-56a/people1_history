class CreateTours < ActiveRecord::Migration[7.2]
  def change
    create_table :tours do |t|
      t.text :name
      t.text :name_kana_ruby

      t.timestamps
    end
  end
end
