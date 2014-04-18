class CreateSiInventories < ActiveRecord::Migration
  def self.up
    create_table :si_inventories do |t|
      t.date :date
      t.string :furnace
      t.string :shift
      t.string :no
      t.string :bag
      t.integer :weight
      t.string :grade
      t.string :location
      t.string :remark
      t.string :remark_prod
      t.string :bag_no
      t.string :bag_type
      t.string :operator # who create this bag no.
      t.date :wh_date
      t.string :wh_operator
      t.string :gpo_production
      t.string :gpo_code # to give a gop number to this silicon bag.
      t.string :container_no # to identify the container number which this silicon bag loaded.

      t.timestamps
    end
  end

  def self.down
    drop_table :si_inventories
  end
end
