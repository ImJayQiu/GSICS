class CreateParticalSizes < ActiveRecord::Migration
  def self.up
    create_table :partical_sizes do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :partical_sizes
  end
end
