class CreateMsReworks < ActiveRecord::Migration
  def self.up
    create_table :ms_reworks do |t|
      t.string :lot
      t.string :bag
      t.string :remark
      t.string :operator

      t.timestamps
    end
  end

  def self.down
    drop_table :ms_reworks
  end
end
