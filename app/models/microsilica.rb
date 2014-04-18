#coding: utf-8
class Microsilica < ActiveRecord::Base
  
  validates :date, :bag, :density, :presence=>true 
  validates_uniqueness_of :date, :scope => [:date, :silo, :bag]
  validates_numericality_of :bag, :density
  
  LDENSITY = %w[100 200 250 300 350 400 450 500 550 600 650 700 750 800]
  HDENSITY = %w[100 200 250 300 350 400 450 500 550 600 650 700 750 800]
  
end
