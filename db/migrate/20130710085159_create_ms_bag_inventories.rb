class CreateMsBagInventories < ActiveRecord::Migration
  def self.up
    create_table :ms_bag_inventories do |t|
      t.date :date
      t.string :action
      t.string :bag_type
      t.integer :quantity
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :ms_bag_inventories
  end
end
