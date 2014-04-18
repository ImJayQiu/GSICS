#coding: utf-8
class Coa < ActiveRecord::Base
  
  has_many :coasilicons, :dependent => :destroy 
  accepts_nested_attributes_for :coasilicons, :reject_if => lambda { |a| a[:silicon_id].blank? }, :allow_destroy => true 
  
end
