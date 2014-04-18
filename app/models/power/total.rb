# coding: utf-8

class Power::Total < ActiveRecord::Base

  has_many :furnaces,  :dependent => :destroy
  
  accepts_nested_attributes_for :furnaces, :reject_if => lambda { |a| a[:electricity].blank? }, :allow_destroy => true
  
  validates_uniqueness_of :date, :scope=>[:date, :time]
  
  validate :validate_unique_furnaces
  
  def validate_unique_furnaces
    validate_uniqueness_of_in_memory(
      furnaces, [:furnace, :total_id], 'Duplicate Furnace Number |  炉 号 重 复 ！')
  end
  
end
