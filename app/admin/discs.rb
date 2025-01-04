ActiveAdmin.register Disc do
  permit_params :title, :title_ruby, :announcement_date, :release_date, :production_type, disc_versions_attributes: [:id, :version, :price, :_destroy]

  form do |f|
    f.inputs do
      f.input :title
      f.input :title_ruby
      f.input :production_type
      f.input :announcement_date
      f.input :release_date
    end

    f.inputs do
      f.has_many :disc_versions, allow_destroy: true do|t|
        t.input :version
        t.input :price
      end
    end

    f.actions
  end

end
