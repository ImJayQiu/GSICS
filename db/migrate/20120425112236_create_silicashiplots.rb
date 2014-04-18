class CreateSilicashiplots < ActiveRecord::Migration
  def self.up
    create_table :silicashiplots do |t|
      t.string :silicaship_id
      t.string :lot
      t.integer :weight
      t.string :location
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :silicashiplots
  end
end
