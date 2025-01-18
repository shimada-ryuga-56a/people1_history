ActiveAdmin.register Member do
  remove_filter :image_attachment, :image_blob, :instruments
end
