#coding: utf-8
class Sampleresult < ActiveRecord::Base
  
  validates_uniqueness_of :week, :scope => [:week, :stype, :silo]
  
  
end
