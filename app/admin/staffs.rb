ActiveAdmin.register Staff do
  permit_params :name, :display
  # preserve_default_filters!
  filter :name
  filter :created_at
  filter :updated_at
end
