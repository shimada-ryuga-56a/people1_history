ActiveAdmin.register Event do
  remove_filter :tour, :event_informations, :event_bookmarks, :disc_contents, :setlist, :link_contents, :visual_image_attachment, :visual_image_blob, :place, :remark, :is_canceled
end
