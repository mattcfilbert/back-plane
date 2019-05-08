class CreateProductionOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :production_operations do |t|
      t.boolean :complete
      t.date :complete_date
      t.references :produceable, polymorphic: true, index: { name: 'produceable_index' }
     
      t.timestamps
    end
  end
end
