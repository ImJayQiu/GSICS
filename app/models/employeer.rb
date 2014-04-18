class Employeer < ActiveRecord::Base
  
  has_many :employeer_photos, :dependent => :destroy
  
  accepts_nested_attributes_for :employeer_photos, :reject_if => lambda { |a| a[:photo].blank? }, :allow_destroy => true
  
  
  
end
