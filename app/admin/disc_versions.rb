ActiveAdmin.register DiscVersion do
  permit_params :disc_id, :version, :price, :jacket, :remove_jacket
  remove_filter :jacket_attachment, :jacket_blob

  form do |f|
    f.inputs do
      f.input :disc
      f.input :version
      f.input :price
      f.input :jacket, as: :file, hint: f.object.jacket.present? ? image_tag(f.object.jacket) : nil
      if f.object.jacket.present?
        f.input :remove_jacket, as: :boolean, required: :false, label: '画像を削除する'
      end
    end

    f.actions
  end
end
