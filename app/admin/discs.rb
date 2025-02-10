ActiveAdmin.register Disc do
  remove_filter :links, :disc_dates
  permit_params :title, :title_ruby, :announcement_date, :release_date, :production_type,
                disc_versions_attributes: [:id, :version, :price, :_destroy],
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
      end
    end

    f.inputs do
      f.has_many :disc_dates, allow_destroy: true do |t|
        t.input :date_type
        t.input :date, start_year: 2020
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
