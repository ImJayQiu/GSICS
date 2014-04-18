class CreateMsshipbags < ActiveRecord::Migration
  def self.up
    create_table :msshipbags do |t|
      t.string :msshiplot_id
      t.integer :bag # shipped bag number
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :msshipbags
  end
end
