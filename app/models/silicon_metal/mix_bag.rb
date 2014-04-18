class SiliconMetal::MixBag < ActiveRecord::Base

has_many :mix_bag_contents, :dependent => :destroy, :order => "old_bag_no"
  
  accepts_nested_attributes_for :mix_bag_contents, :reject_if => lambda { |a| a[:old_bag_no].blank? }, :allow_destroy => true

  validates_uniqueness_of :bag_no #, :scope => [:date, :bag_no]
  
  validates :date, :bag_no, :presence=>true 

end
