class CreateMssamples < ActiveRecord::Migration
  def self.up
    create_table :mssamples do |t|
      t.string :cate # product spesific such as 920D
      t.string :location # take from where such as silo 1 2 3
      t.string :weight
      t.string :typ # Weekly sample, EN sample etc.
      t.string :batch # batch code such as A B
      t.string :sdate # sampling peride date start date
      t.string :edate # sampling peride date end date

      t.timestamps
    end
  end

  def self.down
    drop_table :mssamples
  end
end

