class CreatePoControls < ActiveRecord::Migration
  def self.up
    create_table :po_controls do |t|
      t.date :date
      t.string :po_no
      t.string :contract_no
      t.string :customer
      t.date :d_date  # date of delivery
      t.string :destination
      t.string :product
      t.string :grade
      t.string :quantity # total delivery quantity
      t.string :b_size  # bag size
      t.string :p_size  # partical size of product
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :po_controls
  end
end
