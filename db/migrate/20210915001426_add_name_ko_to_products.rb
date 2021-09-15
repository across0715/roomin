class AddNameKoToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :name_ko, :string
  end
end
