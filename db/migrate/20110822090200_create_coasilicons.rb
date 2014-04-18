class CreateCoasilicons < ActiveRecord::Migration
  def self.up
    create_table :coasilicons do |t|
      t.string :coa_id
      t.string :silicon_id
      t.string :bag
      t.text :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :coasilicons
  end
end
