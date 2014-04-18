class CreateMsShippments < ActiveRecord::Migration
  def self.up
    create_table :ms_shippments do |t|
      t.string :po # related PO number
      t.string :gpo # related GPO number
      t.string :product # product name
      t.date :date #shipping date
      t.string :container # container number
      t.string :trailer # trailer number
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :ms_shippments
  end
end
