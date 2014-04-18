class CreateHrOtms < ActiveRecord::Migration
  def self.up
    create_table :hr_otms do |t|
      t.string :e_id # employeer Id
      t.string :dept # department
      t.date :date # OT date
      t.time :stime # start time
      t.time :etime # end time
      t.string :reason # reason of OT

      t.timestamps
    end
  end

  def self.down
    drop_table :hr_otms
  end
end
