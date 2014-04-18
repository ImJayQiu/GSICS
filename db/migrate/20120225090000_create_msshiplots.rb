class CreateMsshiplots < ActiveRecord::Migration
  def self.up
    create_table :msshiplots do |t|
      t.string :ms_shippment_id
      t.string :lsilo #produced silo number
      t.string :lweek #produced week
      t.string :lyear #produced year
      t.string :spec #product spec
      t.integer :bsize # packing size
      

      t.timestamps
    end
  end

  def self.down
    drop_table :msshiplots
  end
end
