class CreateWarehouseSuppliers < ActiveRecord::Migration
  def self.up
    create_table :warehouse_suppliers do |t|
      t.string :code
      t.string :name
      t.string :type
      t.string :phone
      t.string :website
      t.string :address
      t.string :email
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :warehouse_suppliers
  end
end
