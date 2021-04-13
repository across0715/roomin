class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.boolean :available, null: false, default: true
      t.integer :category, null: false
      t.string :name, null: false
      t.string :image, null: false

      t.timestamps
    end
  end
end
