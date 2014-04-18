class CreateDailyreports < ActiveRecord::Migration
  def self.up
    create_table :dailyreports do |t|
      t.date :date
      t.string :dept
      t.string :content
      t.string :unfinish
      t.string :abnormal
      t.string :manager
      t.string :operator

      t.timestamps
    end
  end

  def self.down
    drop_table :dailyreports
  end
end
