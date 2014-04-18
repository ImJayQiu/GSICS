class CreateWarehouseItems < ActiveRecord::Migration
  def self.up
    create_table :warehouse_items do |t|
      t.string :code
      t.string :name
      t.string :c_type
      t.string :spec
      t.string :model
      t.string :dept
      t.string :supplier
      t.integer :quantity
      t.integer :safe
      t.string :location
      t.string :remark
      t.timestamps
    end
  end

  def self.down
    drop_table :warehouse_items
  end
end
