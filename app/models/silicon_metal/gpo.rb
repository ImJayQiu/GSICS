class SiliconMetal::Gpo < ActiveRecord::Base

  validates_uniqueness_of :gpo_code
  
end
