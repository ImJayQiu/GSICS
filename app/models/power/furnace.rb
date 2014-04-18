# coding : utf-8

class Power::Furnace < ActiveRecord::Base

  belongs_to :total,  :foreign_key=>'total_id'
  
end
