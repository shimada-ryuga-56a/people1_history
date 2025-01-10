ActiveAdmin.register TieUp do
  remove_filter :image_attachment, :image_blob
  permit_params :collaboration_title, :song_id, :announce_date, :remark, :jacket, :remove_jacket
end
