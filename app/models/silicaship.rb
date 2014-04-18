#coding: utf-8
class Silicaship < ActiveRecord::Base
  
  has_many :silicashiplots, :dependent => :destroy
  
  accepts_nested_attributes_for :silicashiplots, :reject_if => lambda { |a| a[:lot].blank? }, :allow_destroy => true
  
  validates :code, :po, :customer, :spec, :presence=>true
  
  validates_uniqueness_of :code, :scope => [:date, :po, :container, :code]
  
  validate :validate_unique_lots
  
  def validate_unique_lots
    validate_uniqueness_of_in_memory(
      silicashiplots, [:lot, :silicaship_id], 'Duplicate bags | 产 品 重 复 ！')
  end
  
end

