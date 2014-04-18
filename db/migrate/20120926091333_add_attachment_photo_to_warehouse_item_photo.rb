class AddAttachmentPhotoToWarehouseItemPhoto < ActiveRecord::Migration
  def self.up
    add_column :warehouse_item_photos, :photo_file_name, :string
    add_column :warehouse_item_photos, :photo_content_type, :string
    add_column :warehouse_item_photos, :photo_file_size, :integer
    add_column :warehouse_item_photos, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :warehouse_item_photos, :photo_file_name
    remove_column :warehouse_item_photos, :photo_content_type
    remove_column :warehouse_item_photos, :photo_file_size
    remove_column :warehouse_item_photos, :photo_updated_at
  end
end
