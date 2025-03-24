ActiveAdmin.register Disc do
  remove_filter :links, :disc_dates
  permit_params :title, :title_ruby, :announcement_date, :release_date, :production_type,
                disc_versions_attributes: [:id, :version, :price, :_destroy,
                                           disc_contents_attributes: [:id, :content_type, :event_id, :_destroy,
                                                                     disc_items_attributes: [:id, :position, :title, :song_id, :is_arranged, :_destroy]]],
                link_contents_attributes: [:id, :link_id, :_destroy],
                disc_dates_attributes: [:id, :date_type, :date, :remark, :_destroy]
  menu parent: 'Disc'

  index do
    column :id
    column :title
    column :announcement_date
    column :release_date
    column :production_type
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :title_ruby
      f.input :production_type
      f.input :release_date
      f.input :announcement_date
    end

    f.inputs do
      f.has_many :disc_versions, allow_destroy: true do |t|
        t.input :version
        t.input :price
        t.has_many :disc_contents, allow_destroy: true do |c|
          c.input :content_type
          c.input :event_id, as: :select, collection: Event.order(date: :desc).map { |x| [x.name, x.id] }
          c.has_many :disc_items, allow_destroy: true do |i|
            i.input :position
            i.input :title
            i.input :song_id, as: :select, collection: Song.order(name: :asc).map { |x| [x.name, x.id] }
            i.input :is_arranged, as: :boolean
          end
        end
      end
    end

    f.inputs do
      f.has_many :disc_dates, allow_destroy: true do |t|
        t.input :date_type
        t.input :date, start_year: 2017, end_year: 2060
        t.input :remark
      end
    end

    f.inputs do
      f.has_many :link_contents, allow_destroy: true do |t|
        t.input :link_id, as: :select, collection: Link.order(remark: :asc).map { |x| [x.remark, x.id] }
      end
    end

    f.actions
  end
end
