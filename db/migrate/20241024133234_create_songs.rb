class CreateSongs < ActiveRecord::Migration[7.2]
  def change
    create_table :songs do |t|
      t.string :name, null: false
      t.string :name_kana_ruby, null: false
      t.text :youtube_link

      t.timestamps
    end
  end
end
