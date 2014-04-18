#coding: utf-8
class Msshiplot < ActiveRecord::Base
  
  belongs_to :ms_shippment, :foreign_key => 'ms_shippment_id'
  has_many :msshipbags, :dependent => :destroy, :order => 'bag'
  accepts_nested_attributes_for :msshipbags, :reject_if => lambda { |a| a[:bag].blank? }, :allow_destroy => true
  
    
  validate :validate_unique_bags
  
  def validate_unique_bags
    validate_uniqueness_of_in_memory(
      msshipbags, [:bag, :msshiplot_id], 'Duplicate Bag Number | 产 品 袋 子 编 号 重 复 ！')
  end
  
  
  
end
