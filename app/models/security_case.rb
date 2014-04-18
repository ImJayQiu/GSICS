#coding: utf-8
class SecurityCase < ActiveRecord::Base
  
   has_many :security_case_medium, :dependent => :destroy
  
  accepts_nested_attributes_for :security_case_medium, :reject_if => lambda { |a| a[:media].blank? }, :allow_destroy => true
  
  
  
end
