class CreateMsOffgrades < ActiveRecord::Migration
  def self.up
    create_table :ms_offgrades do |t|
      t.date :date
      t.string :origin
      t.string :m_type
      t.string :weight
      t.string :location
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :ms_offgrades
  end
end
