ActiveAdmin.register Link do
  permit_params :platform, :url_link, :remark
  filter :created_at
  filter :updated_at
  filter :remark
end
