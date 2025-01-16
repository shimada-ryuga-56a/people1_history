ActiveAdmin.register Link do
  filter :created_at
  filter :updated_at
  filter :remark

  permit_params :platform, :url_link, :remark, link_dates_attributes: [:id, :link_id, :date, :date_type, :remark, :_destroy]

  form do |f|
    f.inputs do
      f.input :platform
      f.input :url_link
      f.input :remark
    end

    f.inputs do
      f.has_many :link_dates, allow_destroy: true, new_record: true do |t|
        t.input :date
        t.input :date_type
        t.input :remark
      end
    end

    f.actions
  end
end
