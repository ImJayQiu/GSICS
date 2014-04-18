class CreateFreights < ActiveRecord::Migration
  def self.up
    create_table :freights do |t|
      t.string :name
      t.string :contact
      t.string :phone
      t.string :email
      t.string :address
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :freights
  end
end
