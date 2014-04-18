class CreateSiInventoryContents < ActiveRecord::Migration
  def self.up
    create_table :si_inventory_contents do |t|
      t.string :si_inventory_id
      t.date :p_date
      t.string :furnace
      t.string :shift
      t.string :no
      t.integer :weight
      t.string :employee_code

      t.timestamps
    end
  end

  def self.down
    drop_table :si_inventory_contents
  end
end
