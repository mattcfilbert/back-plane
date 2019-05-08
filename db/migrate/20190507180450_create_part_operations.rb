class CreatePartOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :part_operations do |t|
      t.string :name
      t.string :number
      t.references :part, foreign_key: true

      t.timestamps
    end
  end
end
