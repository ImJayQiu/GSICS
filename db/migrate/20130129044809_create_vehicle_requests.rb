class CreateVehicleRequests < ActiveRecord::Migration
  def self.up
    create_table :vehicle_requests do |t|
      t.datetime :s_time
      t.datetime :e_time
      t.string :v_code
      t.string :work
      t.string :remark
      t.string :applicant
      t.string :dept
      t.string :operator

      t.timestamps
    end
  end

  def self.down
    drop_table :vehicle_requests
  end
end
