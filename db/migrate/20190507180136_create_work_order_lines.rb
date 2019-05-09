class CreateWorkOrderLines < ActiveRecord::Migration[5.2]
  def change
    create_table :work_order_lines do |t|
      t.integer :quantity
      t.date :created_date
      t.boolean :released
      t.date :released_date
      t.boolean :complete
      t.date :complete_date
      t.references :workable, polymorphic: true, index: { name: 'workable_index' }
      t.string :part_key
      t.string :work_order_key

      t.timestamps
    end
  end
end
