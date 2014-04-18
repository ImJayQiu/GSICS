class PoControl < ActiveRecord::Base
  
  has_many :ms_loadings
  
  validates :date, :po_no, :product, :grade, :presence=>true
  
  validates_uniqueness_of :po_no
  
end
