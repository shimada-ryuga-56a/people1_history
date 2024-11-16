class AddDetailsToSongs < ActiveRecord::Migration[8.0]
  def change
    add_column :songs, :name_hiragana_ruby, :string
  end
end
