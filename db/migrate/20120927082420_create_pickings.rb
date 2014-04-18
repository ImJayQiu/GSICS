class CreatePickings < ActiveRecord::Migration
  def self.up
    create_table :pickings do |t|
      t.string :code
      t.string :employeer
      t.string :dept
      t.string :wh_item
      t.integer :qty # quantity
      t.string :status
      t.date :r_date
      t.string :operator

      t.timestamps
    end
  end

  def self.down
    drop_table :pickings
  end
end
