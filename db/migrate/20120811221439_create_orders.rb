class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
