class CreateOxygens < ActiveRecord::Migration
  def self.up
    create_table :oxygens do |t|
      
      t.integer :a #氧气产量
      t.integer :b #氧气纯度
      
      t.integer :ch #吸附塔压力-高
      t.integer :cl #吸附塔压力-低
      
      t.integer :dh #均压罐压力-高
      t.integer :dl #均压罐压力-低
      
      t.integer :eh #缓冲罐压力-高
      t.integer :el #缓冲罐压力-低
      
      t.integer :f #环境温度
      t.integer :g #进气温度
      t.integer :h #塔顶温度
      t.integer :i #111风机前后压差
      
      t.integer :jh #风机电机电流-高 
      t.integer :jl #风机电机电流-低
      
      t.integer :k #风机轴伸端温度
      t.integer :l #风机非轴伸端温度
      t.integer :m #171风机水平振动速度
      t.integer :n #172风机水平振动速度
      t.integer :o #仪器表压力
      t.integer :p #氧压机入口压力
      t.float :q #氧压机二级排气压力
      t.integer :r #氧压机一级排气温度
      t.integer :s #氧压机二级排气温度
      t.float :t #氧压机油箱油压
      t.integer :u #氧压机电机电流
      t.float :v #氧压机一级排气压力
      t.string :operator #操作者

      t.timestamps
    end
  end

  def self.down
    drop_table :oxygens
  end
end
