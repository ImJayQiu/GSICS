class CreateCoas < ActiveRecord::Migration
  def self.up
    create_table :coas do |t|
      t.string :code
      t.date :date
      t.string :invoicepo
      t.string :contract
      t.string :spec

      t.timestamps
    end
  end

  def self.down
    drop_table :coas
  end
end
