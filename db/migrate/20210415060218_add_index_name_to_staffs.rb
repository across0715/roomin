class AddIndexNameToStaffs < ActiveRecord::Migration[6.0]
  def change
    add_index :staffs, :name, unique: true
  end
end
