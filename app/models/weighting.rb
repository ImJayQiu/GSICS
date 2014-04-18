#coding: utf-8

class Weighting < ActiveRecord::Base
  
  validates :truck_id, :destination, :cargo, :weight, :presence=>true
  
end

