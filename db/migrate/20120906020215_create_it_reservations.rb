class CreateItReservations < ActiveRecord::Migration
  def self.up
    create_table :it_reservations do |t|
      t.datetime :date
      t.string :device
      t.string :user
      t.string :dept
      t.string :location
      t.string :reason
      t.string :remark
      t.datetime :r_date
      t.string :r_confirm

      t.timestamps
    end
  end

  def self.down
    drop_table :it_reservations
  end
end
