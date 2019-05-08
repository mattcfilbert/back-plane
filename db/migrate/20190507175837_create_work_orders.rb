class CreateWorkOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :work_orders do |t|
      t.string :work_order_number
      t.string :customer
      t.string :customer_order_number
      t.date :due_date
      t.string :status
      t.date :completed_date

      t.timestamps
    end
  end
end
