class AddDisplayToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :display, :boolean, null: false, default: "true"
  end
end
