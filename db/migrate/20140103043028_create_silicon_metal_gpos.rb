class CreateSiliconMetalGpos < ActiveRecord::Migration
  def change
    create_table :silicon_metal_gpos do |t|
      t.string :po
      t.string :gpo_code
      t.integer :weight
      t.date :delivery_date
      t.string :p_size
      t.string :b_size
      t.string :remark
      
      
      t.timestamps
    end
  end
end
