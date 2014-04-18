class CreateEmployeerPhotos < ActiveRecord::Migration
  def self.up
    create_table :employeer_photos do |t|
      t.string :employeer_id
      
      
      t.timestamps
    end
  end

  def self.down
    drop_table :employeer_photos
  end
end
