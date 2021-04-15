ActiveAdmin.register Order do
  permit_params :user_id, :product_id, :quantity, :status, :instruct_staff_id, :instructed_staff_id
  config.sort_order = "status_asc"
  preserve_default_filters!
  filter :status, as: :select, collection: Order.statuses_i18n.invert.transform_values { |v| Order.statuses[v] }

  actions :all, except: [:destroy]

  index do
    selectable_column
    id_column
    column :status, :order, &:status_i18n
    column :room_number do |order|
      link_to order.user.room_number, admin_user_path(order)
    end
    column :user
    column :product
    column :quantity
    column :instruct_staff
    column :instructed_staff
    column :created_at
    # column :updated_at
    actions
  end

  # form do |f|
  #   f.semantic_errors
  #   f.inputs do

  #     input :status, as: :select, collection: Order.statuses_i18n.invert

  #   end
  #   f.actions
  # end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #

  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :product_id, :quantity, :status, :instruct_staff_id, :instructed_staff_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
