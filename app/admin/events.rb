ActiveAdmin.register Event do
  remove_filter :tour, :event_informations, :event_bookmarks, :disc_contents, :setlist, :link_contents, :visual_image_attachment,
                :visual_image_blob, :place, :remark, :is_canceled, :links
  permit_params :category, :name, :name_kana_ruby, :date, :place, :place_prefecture, :remark, :is_canceled, :visual_image,
                :remove_visual_image,
                link_contents_attributes: [:id, :link_id, :_destroy]
  menu parent: 'Event'

  index do
    column :category
    column :name
    column :date
    actions
  end

  form do |f|
    f.inputs do
      f.input :category
      f.input :name
      f.input :name_kana_ruby
      f.input :date
      f.input :place
      f.input :place_prefecture
      f.input :remark
      f.input :is_canceled
      f.input :visual_image, as: :file, hint: f.object.visual_image.present? ? image_tag(f.object.visual_image) : nil
      f.input :remove_visual_image, as: :boolean, required: false, label: '画像を削除する' if f.object.visual_image.present?
    end

    f.inputs do
      f.has_many :link_contents, allow_destroy: true do |t|
        t.input :link_id, as: :select, collection: Link.select(:id, :remark).all.order(remark: :asc).map { |x| [x.remark, x.id] }
      end
    end

    f.actions
  end
end
