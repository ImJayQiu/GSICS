class CreateSiliconMetalMixBags < ActiveRecord::Migration
  def change
    create_table :silicon_metal_mix_bags do |t|
      t.date :date
      t.string :bag_no
      t.string :operator
      t.string :remark
      t.string :location
      t.string :gpo_code # to give a gop number to this silicon bag.
      t.string :container_no # to identify the container number which this silicon bag loaded.


      t.timestamps
    end
  end
end
