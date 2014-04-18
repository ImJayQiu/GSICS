class CreateDailyreportJobs < ActiveRecord::Migration
  def self.up
    create_table :dailyreport_jobs do |t|
      t.string :dailyreport_id
      t.string :job_title
      t.string :time_shift
      t.string :p_attend
      t.string :a_attend
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :dailyreport_jobs
  end
end
