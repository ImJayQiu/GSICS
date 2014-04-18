class CreateHrSubcompanies < ActiveRecord::Migration
  def self.up
    create_table :hr_subcompanies do |t|
      t.string :code
      t.string :name
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :hr_subcompanies
  end
end
