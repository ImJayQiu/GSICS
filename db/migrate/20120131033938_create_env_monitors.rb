class CreateEnvMonitors < ActiveRecord::Migration
  def self.up
    create_table :env_monitors do |t|
      
      t.string :time        # 记录时间
      t.string :p_airtank   # 储气罐压力
      t.string :furnace     # 炉号
      t.string :o_bearing1  # 出铁口风机轴承1温度
      t.string :o_bearing2  # 出铁口风机轴承2温度
      t.string :o_current   # 出铁口电流
      t.string :m_current   # 主风机电流
      t.string :m_speed     # 主风机电机转速
      t.string :m_bearing1  # 主风机轴承1温度
      t.string :m_bearing2  # 主风机轴承2温度
      t.string :m_stator    # 主风机定子温度
      t.string :c_in_t      # 空冷器入口温度
      t.string :o_t         # 预除尘出口温度
      t.string :in_c        # 除尘器入口温度
      t.string :bc_p        # 清灰前除尘器入口压力
      t.string :ac_p        # 清灰后除尘器入口压力
      t.string :rs_bearing1 # 反吸风机轴承1温度 
      t.string :rs_bearing2 # 反吸风机轴承2温度
      t.string :rs_current  # 反吸风机清灰电流
      t.string :operator
      

      t.timestamps
    end
  end

  def self.down
    drop_table :env_monitors
  end
end
