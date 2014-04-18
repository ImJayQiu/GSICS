class CreatePurchaseUnits < ActiveRecord::Migration
  def change
    create_table :purchase_units do |t|
      t.string :code
      t.string :unit
      t.string :remark

      t.timestamps
    end
  end
end
