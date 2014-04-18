#coding:utf-8

class SiInventory < ActiveRecord::Base
  
   
  has_many :si_inventory_contents, :dependent => :destroy
  
  accepts_nested_attributes_for :si_inventory_contents, :reject_if => lambda { |a| a[:p_date].blank? or a[:furnace].blank? or a[:shift].blank? or a[:no].blank? or a[:weight].blank? }, :allow_destroy => true
  
  validates :date, :presence=>true
  
  
  validates_uniqueness_of :bag, :allow_blank=>true, :scope => [:furnace, :shift, :date, :no, :bag]
  
  
  validate :validate_unique_contents
  
  def validate_unique_contents
    validate_uniqueness_of_in_memory(
      si_inventory_contents, [:p_date, :furnace, :shift, :no, :si_inventory_id], 'Duplicate Silicon Matels | 硅 块 号 码 重 复 ！')
  end
  
  
end
