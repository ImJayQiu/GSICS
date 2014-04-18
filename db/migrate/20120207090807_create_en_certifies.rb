class CreateEnCertifies < ActiveRecord::Migration
  def self.up
    create_table :en_certifies do |t|
      t.string :lot

      t.timestamps
    end
  end

  def self.down
    drop_table :en_certifies
  end
end
