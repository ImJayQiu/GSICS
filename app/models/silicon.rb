#coding: utf-8
class Silicon < ActiveRecord::Base

  has_many :pics, :dependent => :destroy

  accepts_nested_attributes_for :pics, :reject_if => lambda { |a| a[:pic].blank? }, :allow_destroy => true
    
  
  
  validates :furnace, :shift, :date, :no, :weight, :presence=>true 
  #validates_numericality_of :fe,:al,:ca,:ti,:p,:b,:na,:cu,:ni,:mn,:sn,:k,:pb,:v,:cr,:zn,:s

 
 
  
  # Prevent duplicate posts.
  validates_uniqueness_of :furnace, :scope => [:furnace, :shift, :date, :no]
  
  FURNACE = %w[1 2 3 4 5 6]
  SHIFT = %w[1 2 3]
  TPOINT = %w[1 3]
  NO = %w[1 2 3 4 5 6]
  BAG = %w[1/1 1/2 2/2 1/3 2/3 3/3 1/4 2/4 3/4 4/4 1/5 2/5 3/5 4/5 5/5 1/8 2/8 3/8 4/8 5/8 6/8 7/8 8/8]
  SITYPE = %w[Unknown Thin Thickness]
  BAGTYPE = %w[T TB] 
    
  FE = %w[5 4 3 2 1 0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1]
  AL = %w[5 4 3 2 1 0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1]
  CA = %w[5 3 2 1 0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1 0.09 0.08 0.07 0.06 0.05 0.04 0.03 0.02 0.01]
  
 
  
end
