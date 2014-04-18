class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :code
      t.string :name
      t.string :country
      t.string :address
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
