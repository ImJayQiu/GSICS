class CreateMsProdConfirms < ActiveRecord::Migration
  def self.up
    create_table :ms_prod_confirms do |t|
      t.date :date
      t.string :manager
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :ms_prod_confirms
  end
end
