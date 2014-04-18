class CreateSiliconMetalPos < ActiveRecord::Migration
  def change
    create_table :silicon_metal_pos do |t|
      t.date :date # po received date
      t.string :po_code # po number
      t.string :customer # name of customer
      t.string :product # type of product
      t.string :grade # grade of silicon metal
      t.integer :b_size # size of packing bag
      t.integer :qty # total require quantity
      t.string :p_size # particle size
      t.string :contract_no 
      t.string :destination # shipping destination
      t.date :deadline # estimate po finish date  
      t.string :remark

      t.timestamps
    end
  end
end
