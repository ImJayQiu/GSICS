class CreateQuartzs < ActiveRecord::Migration
  def self.up
    create_table :quartzs do |t|
      t.string :code
      t.date :date
      t.string :color
      t.string :supplier
      t.string :location
      t.string :fe
      t.string :al
      t.string :ca
      t.string :loi
      t.string :remark

      t.timestamps
    end
  end

  def self.down
    drop_table :quartzs
  end
end
