ActiveAdmin.register Song do
  remove_filter :song_informations, :disc_items, :link_contents, :jk_attachment, :jk_blob, :youtube_link, :links
  permit_params :name, :name_kana_ruby, :name_hiragana_ruby, :announcement_date,
  link_contents_attributes: [:id, :link_id, :_destroy]

  form do |f|
    f.inputs do
      f.input :name
      f.input :name_kana_ruby
      f.input :name_hiragana_ruby
      f.input :announcement_date
    end

    f.inputs do
      f.has_many :link_contents, allow_destroy: true do |t|
        t.input :link_id, as: :select, collection: Link.all.order(remark: :asc).map { |x| [x.remark, x.id] }
      end
    end

    f.actions
  end
end
