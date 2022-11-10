class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      
      t.float :subtotal
      t.float :total
      t.string :shipping

      t.timestamps
    end
  end
end
