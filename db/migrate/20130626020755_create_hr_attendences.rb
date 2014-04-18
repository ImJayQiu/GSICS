class CreateHrAttendences < ActiveRecord::Migration
  def self.up
    create_table :hr_attendences do |t|
      
      t.string :Device_Name #Device Name
      
      t.string :Door #Door

      t.string :Name #Name

      t.string :Emp_No #Emp No

      t.string :Card_No #Card No

      t.string :Time_of_swipe_card #Time of swipe card

      t.string :Event_Explanation #Event Explanation

      t.string :Department #Department

      t.string :eventCode #eventCode

      t.string :devicetype #devicetype


      t.timestamps
    end
  end

  def self.down
    drop_table :hr_attendences
  end
end
