class CreateVehicles < ActiveRecord::Migration
  def self.up
    create_table :vehicles do |t|
      t.string :code #機動車編號
      t.string :v_type #機動車類型
      t.string :model #機動車規格
      t.string :number #機動車牌照號
      t.date :p_date #購買日期
      t.string :price #購買價格
      t.string :engine_no #引擎編號
      t.string :remark 
      t.string :dept #所屬部門

      t.timestamps
    end
  end

  def self.down
    drop_table :vehicles
  end
end
