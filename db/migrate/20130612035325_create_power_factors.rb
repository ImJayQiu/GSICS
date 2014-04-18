class CreatePowerFactors < ActiveRecord::Migration
  def self.up
    create_table :power_factors do |t|
      t.integer :m1 # 主变1用电计算参数
      t.integer :m2 # 主变2用电计算参数
      t.integer :env # 环保用电计算参数
      t.integer :others # 其他用电计算参数
      t.integer :furnace # 硅炉用电计算参数

      t.timestamps
    end
  end

  def self.down
    drop_table :power_factors
  end
end
