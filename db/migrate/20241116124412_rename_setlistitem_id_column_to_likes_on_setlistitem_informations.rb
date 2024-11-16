class RenameSetlistitemIdColumnToLikesOnSetlistitemInformations < ActiveRecord::Migration[8.0]
  def change
    rename_column :likes_on_setlistitem_informations, :setlistitem_id, :setlistitem_information_id
  end
end
