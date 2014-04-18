#coding: utf-8
class Msshipbag < ActiveRecord::Base
  
  belongs_to :msshiplot, :foreign_key=>'msshiplot_id'
  # belongs_to :ms_shippment, :foreign_key=>'msshiplot_id'
  
  validates_numericality_of :bag
  validates_uniqueness_of :bag, :scope => :msshiplot_id 
  
end
