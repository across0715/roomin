class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.integer :status, null: false
      t.references :instruct_staff, null: false
      t.references :instructed_staff, null: false

      t.timestamps
    end
    add_foreign_key :orders, :staffs, column: :instruct_staff_id
    add_foreign_key :orders, :staffs, column: :instructed_staff_id
  end
end
