class CreatePowerFurnaces < ActiveRecord::Migration
  def self.up
    create_table :power_furnaces do |t|
      t.string :total_id 
      t.string :furnace # number of furnace
      t.string :electricity # power usage of furnace
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :power_furnaces
  end
end
