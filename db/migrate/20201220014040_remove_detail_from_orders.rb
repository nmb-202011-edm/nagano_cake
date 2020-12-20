class RemoveDetailFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :payment_method, :integer
    remove_column :orders, :status, :integer
  end
end
