class CreateMicrosilicas < ActiveRecord::Migration
  
  def self.up
    
    create_table :microsilicas do |t|
      t.date :date
      t.string :silo
      t.string :m_type
      t.string :bag
      t.string :size #袋子规格
      t.string :density
      t.string :status
      t.string :operator
      t.string :location
      t.string :inspector
      t.string :remark
      t.timestamps
      
    end
  
  end

  
  def self.down
    
    drop_table :microsilicas
  
  end
  
  
end
