class CreatePurchaseLocations < ActiveRecord::Migration
  def self.up
    create_table :purchase_locations do |t|
      t.string :name
      t.string :phone
      t.string :address

      t.timestamps
    end
  end

  def self.down
    drop_table :purchase_locations
  end
end
