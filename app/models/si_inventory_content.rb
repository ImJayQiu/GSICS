class SiInventoryContent < ActiveRecord::Base
  
  belongs_to :si_inventory, :foreign_key => 'si_inventory_id'
  
end
