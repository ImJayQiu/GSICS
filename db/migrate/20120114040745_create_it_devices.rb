class CreateItDevices < ActiveRecord::Migration
  def self.up
    create_table :it_devices do |t|
      t.string :code
      t.string :dept
      t.string :user
      t.string :type
      t.date :pdate
      t.string :brand
      t.string :model
      t.string :os
      t.string :cpu
      t.string :hdd
      t.string :ram
      t.string :ip
      t.string :mac
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :it_devices
  end
end
