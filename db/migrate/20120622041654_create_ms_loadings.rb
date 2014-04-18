class CreateMsLoadings < ActiveRecord::Migration
  def self.up
    create_table :ms_loadings do |t|
      t.date :date # loading date
      t.string :customer # customer name
      t.string :product # product spec 
      t.integer :bsize # bag size
      t.string :po # PO number
      t.string :po_index # subset of po
      t.string :invoice # 发票号码
      t.string :p_date # 付款时间
      t.integer :quantity 
      t.string :destination
      t.string :c_type # container type (trailer, 20'CY, 20 Bulk, 40'CY)
      t.integer :c_qty # container quantity
      t.string :t_loading # time of loading
      t.datetime :closing # closing time
      t.string :remark
      t.integer :c_cap # capacity of container
      t.string :fifo # first in first out
      t.string :lashing # lashing bags
      t.string :pallet # put pallet or not
      t.string :contact # customer contact person
      t.string :s_mark # shipping mark
      t.string :freight # transportation/shipping/freight company
    
      
      t.timestamps
    end
  end

  def self.down
    drop_table :ms_loadings
  end
end
