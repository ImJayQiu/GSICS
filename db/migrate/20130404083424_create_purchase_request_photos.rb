class CreatePurchaseRequestPhotos < ActiveRecord::Migration
  def self.up
    create_table :purchase_request_photos do |t|
      t.string :request_id

      t.timestamps
    end
  end

  def self.down
    drop_table :purchase_request_photos
  end
end
