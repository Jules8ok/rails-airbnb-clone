class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :menu_id
      t.integer :quantity
      t.datetime :pick_up

      t.timestamps
    end
  end
end
