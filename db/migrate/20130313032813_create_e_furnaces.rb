class CreateEFurnaces < ActiveRecord::Migration
  
  def self.up
    
    create_table :e_furnaces do |t|
      
      #Basic Info. | 基 本 资 料
      t.string :furnace
      t.date :date
      t.string :manager # 炉长
      t.string :foreman_s1
      t.string :foreman_s2
      t.string :foreman_s3
      t.string :operator # 输入人员
      
      #Electricity | 电 耗
      t.integer :s1_e
      t.integer :s2_e
      t.integer :s3_e
      
      #Reactive Power | 无 功 电 耗
      t.integer :s1_rp
      t.integer :s2_rp
      t.integer :s3_rp

      #Quartzs | 矿 石 领 用
      t.integer :s1_q
      t.integer :s2_q
      t.integer :s3_q
      
      #Wood | 木 头
      t.integer :s1_w
      t.integer :s2_w
      t.integer :s3_w
      
      #Charcoal | 木 炭
      t.integer :s1_ch
      t.integer :s2_ch
      t.integer :s3_ch
      
      #Coke | 石 油 焦
      t.integer :s1_c
      t.integer :s2_c
      t.integer :s3_c
      
      #Fe | 铁
      
      t.integer :s1_fe
      t.integer :s2_fe
      t.integer :s3_fe
      
      # electrode | 电极
      
      t.integer :s1_electrode_a
      t.integer :s2_electrode_a
      t.integer :s3_electrode_a
      
      t.integer :s1_electrode_b
      t.integer :s2_electrode_b
      t.integer :s3_electrode_b
      
      t.integer :s1_electrode_c
      t.integer :s2_electrode_c
      t.integer :s3_electrode_c
      
      t.string :remark
      
      t.timestamps
    end
    
  end

  def self.down
    drop_table :e_furnaces
  end
end
