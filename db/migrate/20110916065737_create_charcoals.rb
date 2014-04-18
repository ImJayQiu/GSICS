class CreateCharcoals < ActiveRecord::Migration
  def self.up
    create_table :charcoals do |t|
      t.string :su_code
      t.string :form_code
      t.string :weightbridge_code
      t.date :date
      t.string :truck_no
      t.string :partical_weight
      t.string :weight
      t.string :doc1
      t.string :doc2
      t.string :doc3
      t.string :doc4
      t.string :doc5
      t.string :doc6
      t.string :inspector
      t.string :grade
      t.string :crash_sum_form
      t.string :t1
      t.string :t2
      t.string :t3
      t.string :t4
      t.string :t5
      t.string :t6
      t.string :analyst
      t.string :remark
      t.string :ctype

      t.timestamps
    end
  end

  def self.down
    drop_table :charcoals
  end
end
