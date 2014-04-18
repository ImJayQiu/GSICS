class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.date :date
      t.string :invoice
      t.string :po
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
