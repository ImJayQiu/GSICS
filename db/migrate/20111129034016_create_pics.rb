class CreatePics < ActiveRecord::Migration
  def self.up
    create_table :pics do |t|
      t.string :pic_file_name
      t.string :pic_content_type
      t.integer :pic_file_size
      t.datetime :pic_updated_at
      t.integer :silicon_id

      t.timestamps
    end
  end

  def self.down
    drop_table :pics
  end
end
