ActiveAdmin.register DiscItem do
  permit_params :disc_content_id, :position, :song_id, :title, :is_arranged

  form do |f|
    f.inputs do
      f.input :disc_content_id
      f.input :position
      f.input :song
      f.input :title
      f.input :is_arranged
    end

    f.actions
  end
end
