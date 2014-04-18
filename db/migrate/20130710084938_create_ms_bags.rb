class CreateMsBags < ActiveRecord::Migration
  def self.up
    create_table :ms_bags do |t|
      t.string :code
      t.string :bag_type
      t.integer :safe
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :ms_bags
  end
end
