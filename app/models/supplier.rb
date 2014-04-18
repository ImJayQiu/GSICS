#coding: utf-8
class Supplier < ActiveRecord::Base
  
  
    validates_uniqueness_of :code
  CATEGORY = %w[Charcoal Quartz]
  
end
