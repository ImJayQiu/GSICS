class CreateHrPositions < ActiveRecord::Migration
  def self.up
    create_table :hr_positions do |t|
      t.string :code
      t.string :name
      t.integer :salary
      t.integer :bonus
      t.integer :benfit1
      t.integer :benfit2
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :hr_positions
  end
end
