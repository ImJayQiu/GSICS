class CreateWarehouseCheckins < ActiveRecord::Migration
  def change
    create_table :warehouse_checkins do |t|
      t.date :date
      t.string :p_code
      t.string :item_code
      t.integer :w_qty
      t.string :remark
      t.string :operator

      t.timestamps
    end
  end
end
