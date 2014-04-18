class CreateSamples < ActiveRecord::Migration
  def self.up
    create_table :samples do |t|
      t.string :date #date to send samplea
      t.string :destination # where to send samples
      t.string :com # which delivery company
      t.string :awb # bill No.
      t.string :price # Delivery Price
      t.string :product #Microsilica or Silicon Metal

      t.timestamps
    end
  end

  def self.down
    drop_table :samples
  end
end
