ActiveAdmin.register Tour do
  filter :created_at
  filter :updated_at

  permit_params :tour_id, :id, :name, :name_kana_ruby,
                events_attributes: [:id, :category, :name, :name_kana_ruby, :date, :place, :place_prefecture,
                                    :remark, :is_canceled, :_destroy],
                link_contents_attributes: [:id, :link_id, :_destroy]
  menu parent: 'Event'

  form do |f|
    f.inputs do
      f.input :name
      f.input :name_kana_ruby
    end

    f.inputs do
      f.has_many :link_contents, allow_destroy: true do |t|
        t.input :link_id, as: :select, collection: Link.order(remark: :asc).map { |x| [x.remark, x.id] }
      end
    end

    f.inputs do
      f.has_many :events, allow_destroy: true do |t|
        t.input :name
        t.input :name_kana_ruby
        t.input :date
        t.input :category
        t.input :place_prefecture
        t.input :place
        t.input :is_canceled
        t.input :remark
      end
    end

    f.actions
  end
end
