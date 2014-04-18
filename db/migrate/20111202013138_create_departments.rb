class CreateDepartments < ActiveRecord::Migration
  def self.up
    create_table :departments do |t|
      t.string :code
      t.string :abb #缩写词 abbreviation
      t.string :name
      t.string :manager

      t.timestamps
    end
  end

  def self.down
    drop_table :departments
  end
end
