ActiveAdmin.register Tour do
  remove_filter :events

  permit_params :name, :name_kana_ruby,
                events_attributes: [:category, :name, :name_kana_ruby, :date, :place, :place_prefecture,
                                    :remark, :is_canceled, :_destroy]

  form do |f|
    f.inputs do
      f.input :name
      f.input :name_kana_ruby
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
