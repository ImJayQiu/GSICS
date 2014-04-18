class CreateRmRates < ActiveRecord::Migration
  def self.up
    create_table :rm_rates do |t|
      t.string :code
      t.string :name
      t.string :rate

      t.timestamps
    end
  end

  def self.down
    drop_table :rm_rates
  end
end
