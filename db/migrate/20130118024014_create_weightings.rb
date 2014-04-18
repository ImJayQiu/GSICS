class CreateWeightings < ActiveRecord::Migration
  def self.up
    create_table :weightings do |t|
      t.string :form_no
      t.string :truck_id
      t.string :destination
      t.string :truck_type
      t.string :cargo
      t.integer :weight
      t.string :remark
      t.string :operator

      t.timestamps
    end
  end

  def self.down
    drop_table :weightings
  end
end
