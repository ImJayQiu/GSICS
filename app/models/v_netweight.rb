#coding:utf-8

class VNetweight < ActiveRecord::Base
  
  validates_uniqueness_of :date, :scope => [:code, :date]
  
end
