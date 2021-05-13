class AddNameEnToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :name_ja, :string
    add_column :products, :name_th, :string
    add_column :products, :name_zh_CN, :string
    add_column :products, :name_fr_FR, :string
  end
end
