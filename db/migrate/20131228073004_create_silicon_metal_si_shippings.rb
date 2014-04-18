class CreateSiliconMetalSiShippings < ActiveRecord::Migration
  def change
    create_table :silicon_metal_si_shippings do |t|
      t.date :date
      t.string :container_no
      t.string :operator
      t.string :remark

      t.timestamps
    end
  end
end
