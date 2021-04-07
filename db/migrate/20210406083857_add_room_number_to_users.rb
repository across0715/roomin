class AddRoomNumberToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :room_number, :integer
    add_column :users, :name, :string
    add_column :users, :used, :boolean, null: false, default: "false"
    add_column :users, :available, :boolean, null: false, default: "true"
    add_column :users, :activated_at, :datetime, null: false
  end
end
