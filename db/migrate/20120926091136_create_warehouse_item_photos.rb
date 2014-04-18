class CreateWarehouseItemPhotos < ActiveRecord::Migration
  def self.up
    create_table :warehouse_item_photos do |t|
      t.string :warehouse_item_id

      t.timestamps
    end
  end

  def self.down
    drop_table :warehouse_item_photos
  end
end
