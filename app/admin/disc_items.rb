ActiveAdmin.register DiscItem do
  permit_params :disc_content_id, :position, :song_id, :title, :is_arranged
  menu parent: 'Disc'

  includes :disc_content, :song

  filter :song
  filter :title
  filter :created_at
  filter :updated_at

  index do
    id_column
    column :id
    column :disc_content
    column :position
    column :song
    column :title
    actions
  end

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
