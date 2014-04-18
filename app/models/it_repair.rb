#coding: utf-8
class ItRepair < ActiveRecord::Base
  
  validates :name, :dept, :phone, :detail, :c_name, :presence=>true 
  validates_uniqueness_of :code
  
  IT_TYPE = %w[CPU Mornitor Printer Keyboard Mouse Network System Software Other]
  
  
  
end
