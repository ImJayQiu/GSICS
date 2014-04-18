#coding: utf-8
class Mssample < ActiveRecord::Base
  
  belongs_to :sample
  
  validates :cate, :location, :weight, :typ, :batch, :sdate, :edate, :presence=>true 
  
end
