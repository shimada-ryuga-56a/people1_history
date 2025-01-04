ActiveAdmin.register DiscContent do
  permit_params :disc_version_id, :event_id, :content_type

  form do |f|
    f.inputs do
      f.input :disc_version_id
      f.input :content_type
      f.input :event
    end

    f.actions
  end
end
