class CreateVehicleDailies < ActiveRecord::Migration
  def self.up
    create_table :vehicle_dailies do |t|
      t.date :date
      t.string :v_id
      t.string :fuel
      t.string :distance
      t.string :rtime
      t.string :operator
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :vehicle_dailies
  end
end
