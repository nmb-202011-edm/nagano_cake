class AddProductionStatusToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :production_status, :integer, default: 0
  end
end
