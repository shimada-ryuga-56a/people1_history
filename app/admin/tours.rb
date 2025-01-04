ActiveAdmin.register Tour do
  remove_filter :events

  permit_params :name, :name_kana_ruby, events_attributes: [:category, :name, :name_kana_ruby, :date, :place, :place_prefecture, :remark, :is_canceled, :_destroy]
end
