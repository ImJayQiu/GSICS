class CreateSilos < ActiveRecord::Migration
  def self.up
    create_table :silos do |t|
      t.string :silo
      t.string :temperture
      t.string :pressure
      t.integer :roots #罗茨风机开度
      t.string :level
      t.string :density
      t.string :operator
      t.string :packing

      t.timestamps
    end
  end

  def self.down
    drop_table :silos
  end
end
