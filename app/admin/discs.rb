ActiveAdmin.register Disc do
  remove_filter :links
  permit_params :title, :title_ruby, :announcement_date, :release_date, :production_type,
                disc_versions_attributes: [:id, :version, :price, :_destroy],
                link_contents_attributes: [:id, :link_id, :_destroy]
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
      f.has_many :link_contents, allow_destroy: true do |t|
        t.input :link_id, as: :select, collection: Link.all.order(remark: :asc).map { |x| [x.remark, x.id] }
      end
    end

    f.actions
  end
end
