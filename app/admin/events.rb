ActiveAdmin.register Event do
  remove_filter :tour, :event_informations, :event_bookmarks, :disc_contents, :setlist, :link_contents, :visual_image_attachment, :visual_image_blob, :place, :remark, :is_canceled
  permit_params :category, :name, :name_kana_ruby, :date, :place, :place_prefecture, :remark, :is_canceled, :visual_image, :remove_visual_image

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

    f.actions
  end
end
