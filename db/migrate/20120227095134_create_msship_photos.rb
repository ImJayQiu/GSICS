class CreateMsshipPhotos < ActiveRecord::Migration
  def self.up
    create_table :msship_photos do |t|
      t.string :ms_shippment_id

      t.timestamps
    end
  end

  def self.down
    drop_table :msship_photos
  end
end
