class CreateComplains < ActiveRecord::Migration
  def self.up
    create_table :complains do |t|
      t.string :code
      t.datetime :date
      t.string :customer_name
      t.string :po
      t.string :ma_dept
      t.string :mi_dept
      t.string :content
      t.string :c_type
      t.string :action
      t.string :trace
      t.datetime :trace_date
      

      t.timestamps
    end
  end

  def self.down
    drop_table :complains
  end
end
