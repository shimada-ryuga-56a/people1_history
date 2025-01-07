ActiveAdmin.register DiscContent do
  permit_params :disc_version_id, :event_id, :content_type,
                disc_items_attributes: [:id, :disc_content_id, :position, :song_id, :title, :is_arranged, :_destroy]
  menu parent: 'Disc'

  includes :event, :disc_version

  filter :created_at
  filter :updated_at

  index do
    id_column
    column :disc_version
    column :content_type
    column :event
    actions
  end

  form do |f|
    f.inputs do
      f.input :disc_version
      f.input :event_id
      f.input :content_type
    end

    f.inputs do
      f.has_many :disc_items, allow_destroy: true do |t|
        t.input :position
        t.input :title
        t.input :song_id, as: :select, collection: Song.select(:name, :id).all.order(name: :asc).map { |x| [x.name, x.id] }
        t.input :is_arranged
      end
    end

    f.actions
  end
end
