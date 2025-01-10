ActiveAdmin.register DiscDate do
  menu parent: 'Disc'
  permit_params :date, :disc_id, :date_type, :remark
end
