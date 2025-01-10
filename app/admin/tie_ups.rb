ActiveAdmin.register TieUp do
  remove_filter :image_attachment, :image_blob, :is_new_song
  permit_params :collaboration_title, :song_id, :announce_date, :remark, :is_new_song, :jacket, :remove_jacket
  includes([:song])
end
