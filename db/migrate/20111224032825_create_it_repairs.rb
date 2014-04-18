class CreateItRepairs < ActiveRecord::Migration
  def self.up
    create_table :it_repairs do |t|
      t.string :code
      t.string :name
      t.string :dept
      t.string :c_name
      t.string :phone
      t.string :problem
      t.string :detail
      t.string :causes
      t.string :solution
      t.string :operation_ip
      t.string :operator

      t.timestamps
    end
  end

  def self.down
    drop_table :it_repairs
  end
end
