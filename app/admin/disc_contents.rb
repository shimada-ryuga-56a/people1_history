ActiveAdmin.register DiscContent do
  permit_params :disc_version_id, :event_id, :content_type

  index do
    id_column
    column :disc_version
    column :content_type
    column :event
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :disc_version_id
      f.input :content_type
      f.input :event
    end

    f.actions
  end
end
