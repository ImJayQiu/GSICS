#coding: utf-8
class VehicleDaily < ActiveRecord::Base

  validates_uniqueness_of :date, :scope => [:v_id, :date]
  
  validates :date, :v_id, :presence=>true

end
