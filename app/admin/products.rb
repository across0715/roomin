ActiveAdmin.register Product do
  permit_params :name, :category, :image, :available

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :category, :image, :available
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :category, :image, :available]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  show do |item_image|
    attributes_table do
      row :name
      row :category
      row :available
      # show画面で画像を表示するためのタグを追加
      row :image do
        image_tag(product.image.url)
      end
    end
  end
end
