class CreateQuartzPhotos < ActiveRecord::Migration
  def self.up
    create_table :quartz_photos do |t|
      t.string :quartz_id

      t.timestamps
    end
  end

  def self.down
    drop_table :quartz_photos
  end
end
