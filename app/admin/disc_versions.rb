ActiveAdmin.register DiscVersion do
  permit_params :disc_id, :version, :price, :jacket, :remove_jacket,
                disc_contents_attributes: [:id, :content_type, :event_id, :_destroy]
  remove_filter :jacket_attachment, :jacket_blob

  form do |f|
    f.inputs do
      f.input :disc
      f.input :version
      f.input :price
      f.input :jacket, as: :file, hint: f.object.jacket.present? ? image_tag(f.object.jacket) : nil
      f.input :remove_jacket, as: :boolean, required: false, label: '画像を削除する' if f.object.jacket.present?
    end

    f.inputs do
      f.has_many :disc_contents, allow_destroy: true do |t|
        t.input :content_type
        t.input :event_id
      end
    end

    f.actions
  end
end
