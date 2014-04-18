#coding: utf-8
class Quartz < ActiveRecord::Base
  
  has_many :quartz_photos, :dependent => :destroy
  
  accepts_nested_attributes_for :quartz_photos, :reject_if => lambda { |a| a[:photo].blank? }, :allow_destroy => true
  
end
