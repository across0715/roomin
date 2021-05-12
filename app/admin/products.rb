ActiveAdmin.register Product do
  permit_params :name, :category, :image, :available

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
