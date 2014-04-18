#coding: utf-8
class Silo < ActiveRecord::Base
  
  validates :pressure, :level, :density, :packing,  :presence=>true 
  
  SILO = %w[1 2 3 4 5]
  BSIZE = %w[500 525 660 1000 1100 1200 bulk]
  STATUS = %w[N-正常 B-起球]
  OGTYPE = %w[G-废灰 H-硬块 O-其他]
  LW = 01..53
  LY = 10..20
  
  # validates :level=>0..15
  
end
