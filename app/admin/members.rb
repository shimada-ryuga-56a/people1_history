ActiveAdmin.register Member do
  remove_filter :image_attachment, :image_blob, :instruments
  permit_params :name, :name_ruby, :role, :x_link, :instagram, :thread, :birthday_year, :birthday_month, :birthday_day,
                :blood_type, :mbti, :birth_place, :image, :remove_image, instruments_attributes: [:id, :name, :_destroy,
                                                                           { gears_attributes: [:id, :name, :remark, :image,:remove_image, :_destroy] }]

  index do
    selectable_column
    id_column
    column :name
    column :role
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :name_ruby
      f.input :role
      f.input :x_link
      f.input :instagram
      f.input :thread
      f.input :birthday_year
      f.input :birthday_month
      f.input :birthday_day
      f.input :blood_type
      f.input :mbti
      f.input :birth_place
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image) : nil
      f.input :remove_image, as: :boolean, required: false, label: '画像を削除する' if f.object.image.present?
    end

    f.has_many :instruments, heading: 'Instruments', allow_destroy: true, new_record: true do |a|
      a.input :name

      a.has_many :gears, heading: 'Gears', allow_destroy: true, new_record: true do |b|
        b.input :name
        b.input :remark
        b.input :image, as: :file, hint: b.object.image.present? ? image_tag(b.object.image) : nil
        b.input :remove_image, as: :boolean, required: false, label: '画像を削除する' if b.object.image.present?
      end
    end
    f.actions
  end
end
