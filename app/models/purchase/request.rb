#coding: utf-8
class Purchase::Request < ActiveRecord::Base
  
  has_many :request_photos,  :dependent => :destroy
  
  # class_name:"Purchase::RequestPhoto",
  validates :deadline, :qty, :date, :unit, :presence=>true
  
  validates_uniqueness_of :code, :allow_nil=>true, :allow_blank=>true
  
  
  
  accepts_nested_attributes_for :request_photos, :reject_if => lambda { |a| a[:photo].blank? }, :allow_destroy => true
  
  PURCHASE_TYPE = %w[Office-办公室 SiMetal-金属硅炉  SiFe-硅铁炉]
  
end
