ActiveAdmin.register Link do
  includes :link_contents
  permit_params :platform, :url_link, :remark
  filter :created_at
  filter :updated_at
  filter :remark
end
