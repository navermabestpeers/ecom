class CreateLineitems < ActiveRecord::Migration[7.0]
  def change
    create_table :lineitems do |t|
      
      t.integer :product_id
      t.integer :order_id
      t.float :unit_price
      t.integer :quantity
      t.integer :total_price

      t.timestamps
    end
  end
end
