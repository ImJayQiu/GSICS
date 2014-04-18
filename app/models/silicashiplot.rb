#coding: utf-8
class Silicashiplot < ActiveRecord::Base
  
  belongs_to :silicaship, :foreign_key=>'silicaship_id'
  validates_uniqueness_of :lot, :scope=>'silicaship_id' 
  
end
