class RemoveColumnFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :total, :float
    remove_column :orders, :shipping, :string
  end
end
