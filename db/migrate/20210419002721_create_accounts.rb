class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.integer :user_quantity
      t.references :staff, foreign_key: true
      t.timestamps
    end
  end
end
