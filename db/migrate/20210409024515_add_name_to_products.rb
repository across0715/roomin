class AddNameToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :category, :integer, null: false
    add_column :products, :name, :string, null: false
    add_column :products, :image, :string, null: false
    add_column :products, :available, :boolean, null: false, default: "true"
  end
end
