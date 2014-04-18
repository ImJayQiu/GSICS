#coding: utf-8

class EFurnace < ActiveRecord::Base
  
  validates :date,:furnace, 
    :foreman_s1, :foreman_s2, :foreman_s3, 
    :presence=>true 
  
  validates_numericality_of :s1_e, :s1_q, :s1_ch, :s1_w, :s1_c, 
    :s2_e, :s2_q, :s2_ch, :s2_w, :s2_c, 
    :s3_e, :s3_q, :s3_ch, :s3_w, :s3_c
  
  validates_uniqueness_of :furnace, :scope => [:furnace, :date]
  
   
end
