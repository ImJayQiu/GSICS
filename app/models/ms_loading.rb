#coding: utf-8

class MsLoading < ActiveRecord::Base

  belongs_to :po_control, :foreign_key => 'po'
  
  CTYPE = %w[Trailer 20'CY 20Bulk 40'CY]
  TL = %w[Morning(上午) Afternoon(下午) ]
  SELECT = %w[YES NO]
  
  validates :date, :invoice, :po, :p_date, :presence=>true 
  #validates_numericality_of
  
  
  validates_uniqueness_of :po, :scope => [:invoice, :date, :po, :po_index], :message=>"该 P.O. 已在发货列表中, 请重新确认 P.O.号码 ！ Current Purchasing Order has been taken ! Please check again !"
  
  validates_uniqueness_of :invoice, :scope => [:invoice, :date, :po, :po_index]

  
  
end
