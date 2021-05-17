ActiveAdmin.register Product do
  permit_params :name_en, :category, :image, :available, :name_ja, :name_th, :name_fr_FR, :name_zh_CN

  show do |item_image|
    attributes_table do
      row :name_en
      row :name_ja
      row :name_th
      row :name_fr_FR
      row :name_zh_CN
      row :category
      row :available
      # show画面で画像を表示するためのタグを追加
      row :image do
        image_tag(product.image.url)
      end
    end
  end
end
