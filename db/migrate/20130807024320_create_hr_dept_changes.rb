class CreateHrDeptChanges < ActiveRecord::Migration
  def self.up
    create_table :hr_dept_changes do |t|
      t.date :date
      t.string :employee_no
      t.string :dept_old
      t.string :dept_new
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :hr_dept_changes
  end
end
