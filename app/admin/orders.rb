ActiveAdmin.register Order do
  permit_params :user_id, :product_id, :quantity, :status, :instruct_staff_id, :instructed_staff_id
  config.sort_order = "status_asc"
  preserve_default_filters!
  filter :status, :as => :select, :collection => [["accept", "1"], ["comlete", "2"], ["unavailable", "3"]]
  # ActiveAdmin.register_page "Order_Complete" do
  #   belongs_to :order
  # end

  actions :all, except: [:destroy]

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
