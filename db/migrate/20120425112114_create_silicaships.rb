class CreateSilicaships < ActiveRecord::Migration
  def self.up
    create_table :silicaships do |t|
      t.date :date
      t.string :po
      t.string :coa
      t.string :spec
      t.string :container
      t.string :customer
      t.string :code # Packing list form code
      t.string :create_user # Person who create this form
      t.string :gpo

      t.timestamps
    end
  end

  def self.down
    drop_table :silicaships
  end
end
