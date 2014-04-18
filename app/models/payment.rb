class Payment < ActiveRecord::Base

  validates :date, :invoice, :presence=>true 
  #validates_numericality_of
  validates_uniqueness_of :invoice, :scope => [:invoice, :date, :po]

end
