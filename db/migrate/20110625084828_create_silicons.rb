class CreateSilicons < ActiveRecord::Migration
  def self.up
    create_table :silicons do |t|
      t.string :code
      t.date :date
      t.string :furnace
      t.string :shift
      t.string :no
      t.string :grade
      t.string :si_type
      t.integer :weight
      t.integer :sweight
      t.integer :tpoint
      t.integer :fe
      t.integer :al
      t.integer :ca
      t.integer :ti
      t.integer :p
      t.integer :b
      t.integer :na
      t.integer :cu
      t.integer :ni
      t.integer :mn
      t.integer :sn
      t.integer :k
      t.integer :pb
      t.integer :v
      t.integer :cr
      t.integer :zn
      t.integer :s
      t.text :remark
      t.string :operator
      t.string :sampler
      t.string :location_pa
      t.string :location_po
      t.timestamps
    end
  end

  def self.down
    drop_table :silicons
  end
end
