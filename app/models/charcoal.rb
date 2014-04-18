#coding: utf-8
class Charcoal < ActiveRecord::Base
  
  has_many :charcoal_dusts, :dependent => :destroy
  accepts_nested_attributes_for :charcoal_dusts, :reject_if => lambda { |a| a[:bweight].blank? }, :allow_destroy => true
  
  validates :su_code, :form_code, :presence=>true 
  # :weightbridge_code, :weight, :partical_weight
  # validates_numericality_of :weight
  validates_uniqueness_of :form_code, :scope => [:form_code, :date]
  
  DOC = %w[OK N/A]
  
  GRADES = %w[N/A 1 2 3 4 5]
  
  CTYPES = %w[Mangrove Benjapan]
  
end
