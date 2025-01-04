ActiveAdmin.register Song do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :name_kana_ruby, :youtube_link, :name_hiragana_ruby, :announcement_date
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :name_kana_ruby, :youtube_link, :name_hiragana_ruby, :announcement_date]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  remove_filter :song_informations
  remove_filter :disc_items
  remove_filter :link_contents
  remove_filter :jk_attachment
  remove_filter :jk_blob
  remove_filter :youtube_link
end
