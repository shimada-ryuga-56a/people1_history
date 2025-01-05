ActiveAdmin.register History do
  remove_filter :image_attachment, :image_blob
  permit_params :title, :user_id, :date, :remark, :image, :remove_image
  form do |f|
    f.inputs do
      f.input :title
      f.input :user
      f.input :date
      f.input :remark
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image) : nil
      f.input :remove_image, as: :boolean, required: false, label: '画像を削除する' if f.object.image.present?
    end
    f.actions
  end
end
