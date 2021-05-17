class RenameNameColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :name, :name_en
  end
end
