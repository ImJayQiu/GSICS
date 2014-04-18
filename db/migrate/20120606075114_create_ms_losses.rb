class CreateMsLosses < ActiveRecord::Migration
  def self.up
    create_table :ms_losses do |t|
      t.date :s_date
      t.date :e_date
      t.string :spec
      t.string :bsize
      t.string :qty
      t.string :operator
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :ms_losses
  end
end
