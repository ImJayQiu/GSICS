#coding: utf-8
class MsShippment < ActiveRecord::Base
  
  has_many :msshiplots, :dependent => :destroy, :order => "lyear, lweek, lsilo"
  # has_many :msshipbags, :through=>:msshiplots, :order => 'bag'
  has_many :msship_photos, :dependent => :destroy
  
  accepts_nested_attributes_for :msshiplots, :reject_if => lambda { |a| a[:lsilo].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :msship_photos, :reject_if => lambda { |a| a[:photo].blank? }, :allow_destroy => true

  
  validates_uniqueness_of :date, :scope => [:date, :container, :trailer ]
  
  validate :validate_unique_lots
  
  def validate_unique_lots
    validate_uniqueness_of_in_memory(
      msshiplots, [:lyear, :lweek, :lsilo, :bsize, :spec, :ms_shippment_id], 'Duplicate Batch Number | 产 品 批 号 重 复 ！')
  end
  
end
