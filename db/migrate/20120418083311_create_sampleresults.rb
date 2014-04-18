class CreateSampleresults < ActiveRecord::Migration
  def self.up
    create_table :sampleresults do |t|
      t.date :date
      t.string :stype
      t.integer :week
      t.string :silo
      t.float :h20
      t.float :loi
      t.float :sic
      t.float :c
      t.float :density
      t.float :sieve
      t.float :ph
      t.float :sio2
      t.float :fe
      t.float :al
      t.float :ca
      t.float :mg
      t.float :na
      t.float :k
      t.float :p
      t.float :s
      t.float :cl

      t.timestamps
    end
  end

  def self.down
    drop_table :sampleresults
  end
end
