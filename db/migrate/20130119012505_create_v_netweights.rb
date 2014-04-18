class CreateVNetweights < ActiveRecord::Migration
  def self.up
    create_table :v_netweights do |t|
      t.date :date
      t.string :code
      t.string :net_weight
      t.string :remark
      t.string :operator

      t.timestamps
    end
  end

  def self.down
    drop_table :v_netweights
  end
end
