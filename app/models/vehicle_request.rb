#coding: utf-8

class VehicleRequest < ActiveRecord::Base
  
  validates :operator, :applicant, :work, :v_code, :s_time, :e_time, :presence=>true 
  
end
