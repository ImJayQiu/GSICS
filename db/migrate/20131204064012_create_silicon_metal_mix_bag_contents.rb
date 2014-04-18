class CreateSiliconMetalMixBagContents < ActiveRecord::Migration
  def change
    create_table :silicon_metal_mix_bag_contents do |t|
      t.string :mix_bag_id
      t.string :old_bag_no
      t.integer :weight
      t.string :operator

      t.timestamps
    end
  end
end
