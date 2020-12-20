class RemoveDetailFromOrderItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_items, :production_status, :integer
  end
end
