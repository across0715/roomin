class AddProductCountToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :product_count, :integer, null: false
    add_column :orders, :status, :integer, null: false
    add_column :orders, :instruct_employee_id, :integer, null: false
    add_column :orders, :instructed_employee_id, :integer, null: false
  end
end
