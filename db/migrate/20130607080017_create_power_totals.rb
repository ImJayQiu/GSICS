class CreatePowerTotals < ActiveRecord::Migration
  def self.up
    create_table :power_totals do |t|
      t.date :date # date of data recording
      t.string :time # 抄表时间
      t.string :m_1 # 1号主变
      t.string :m_2 # 2号主变
      t.string :env # 环保
      t.string :others # 其他
      t.string :operator # person who input the data
      t.string :remark # 备注

      t.timestamps
    end
  end

  def self.down
    drop_table :power_totals
  end
end
