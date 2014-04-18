class CreateInterviewsIts < ActiveRecord::Migration
  def self.up
    create_table :interviews_its do |t|
      t.string :ans1
      t.string :ans2
      t.string :ans3
      t.string :ans4
      t.string :ans5
      t.string :ans6
      t.string :ans7
      t.string :ans8
      t.string :ans9
      t.string :ans10
      t.string :name
      t.string :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :interviews_its
  end
end
