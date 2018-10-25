class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :item_name
      t.float :price
      t.text :description
      t.integer :status

      t.timestamps
    end
  end
end
