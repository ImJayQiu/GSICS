#coding: utf-8

class WarehouseItem < ActiveRecord::Base
  
  
  has_many :warehouse_item_photos, :dependent => :destroy
  
  accepts_nested_attributes_for :warehouse_item_photos, :reject_if => lambda { |a| a[:photo].blank? }, :allow_destroy => true
  
  
  
  
  validates_uniqueness_of :name, :scope => [:c_type, :dept, :code, :name]
  
  
  TYPE = %w[01-OA-辦公文具 02-CP-電腦用品 03-WA-配管五金 04-HD-一般五金 05-MD-電機減速機類 06-EL-配電儀錶 07-CL-打掃用具 08-MT-金屬原料 09-HY-油壓配件 10-MA-機械零配件 11-TO-工具類 12-CO-冷卻系統 00-others-其他]
  DEPT = %w[01-OA-辦公室 02-ST-倉庫 03-QC-品保 04-PK-包裝 05-MF-生產 06-EL-電工 07-MT-修台包 08-DR-駕駛 09-EV-環保 10-EG-機修 11-OX-制氧 12-IT-資工 13-MI-破碎 others-其他]
  
end
