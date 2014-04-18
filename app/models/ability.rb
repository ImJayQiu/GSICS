#coding: utf-8

class Ability
  
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new # guest user (not logged in)
    
    
    if user.role == 'admin'
      can :manage, :all
    end
    
    if user.role == 'ceo'
      can :view, :all
      can :print, :all
      can :search, :all
    end
    
    if user.role == 'weight_room'
      can :view, :site
      can :view, :index_silicons
      can :create, :weighting
      can :edit, :weighting
      can :print, :weighting
      can :create, :charcoals
      can :view, :charcoals
      can :edit, :charcoals
      can :create, :charcoals_basic
    end
    
    if user.role == 'vehicle'
      can :view, :site
      can :view, :index_silicons
      can :manage, :vehicles
      can :search, :silicon_daily_report
      can :print, :material_forcast
    end
    
    if user.role == 'daily_report'
      can :view, :all
      can :edit, :dailyreport
      can :create, :dailyreport
    end
    
    if user.role == 'qc_master'
      can :view, :site
      can :view, :index_silicons
      can :manage, :silicons
      can :manage, :grades
      can :edit, :charcoals
      can :view, :charcoals
      can :print, :charcoals
      can :analysis, :charcoals
      can :manage, :charcoal_analyst
      can :manage, :material_suppliers
      can :manage, :silicons_sample
      can :create, :silicons_sign
      can :manage, :coas
      can :search, :silicons
      can :print, :material_forcast
      can :manage, :ms_samples
      can :manage, :marketing
      can :edit, :complain
      can :manage, :sampleresults
      can :search, :silicon_period_report
      can :search, :silicon_daily_report
      can :manage, :silicon_ship
      can :edit, :microsilicas
      can :edit, :ms_location
      can :view, :quartzs
      can :create, :quartzs
      can :edit, :quartzs
      can :manage, :suppliers
      can :manage, :si_inventory
      can :create, :dailyreport
      can :edit, :dailyreport
      can :print, :silicon_daily_report
      can :search, :charcoals
      
    end
    
    if user.role == 'qc_inspector'
      can :view, :site
      can :view, :index_silicons
      can :view, :silicons
      can :edit, :charcoals
      can :view, :charcoals
      can :print, :charcoals
      can :view, :charcoal_analyst
      can :view, :silicons_sample
      can :search, :silicons
      can :view, :ms_samples
      can :view, :marketing
      can :edit, :complain
      can :view, :sampleresults
      can :search, :silicon_period_report
      can :search, :silicon_daily_report
      can :view, :silicon_ship
      can :edit, :microsilicas
      can :edit, :ms_location
    end
      
    if user.role == 'qc'
      can :view, :site
      can :view, :silicons
      can :create, :silicons 
      can :edit, :silicons
      can :edit, :charcoals
      can :view, :charcoals
      can :print, :charcoals
      can :analysis, :charcoals
      can :manage, :charcoal_analyst
      can :search, :silicons
      can :view, :silicon_ship
      can :view, :silicon_ship
      can :edit, :silicon_ship
      can :create, :silicon_ship
      #can :manage, :si_inventory
    end
    
    if user.role == 'sampler'            
      can :view, :site
      can :view, :silicons
      can :create, :silicons
      can :edit, :silicons_sample
      can :create, :silicons_sample_sign
      can :edit, :silicons
      can :search, :silicon_daily_report
    end      
     
    if user.role == 'visitor'
      can :view, :all
    end
    
    if user.role == 'super_visitor'
      can :view, :site
      can :view, :all
      can :view, :index_silicons
      can :view, :charcoals
      can :view, :silicons
      can :view, :markering
      can :search, :silicons
      can :search, :silicon_period_report
      can :search, :silicon_daily_report
      can :print, :all
      can :manage, :silicons
    end
    
    if user.role == 'microsilica_visitor'
      can :view, :site
      cannot :view, :charcoals
      cannot :view, :silicons
      can :view, :env_monitor
      cannot :search, :silicons
      cannot :search, :silicon_period_report
      cannot :search, :silicon_daily_report
      can :view, :po
    end
    
    if user.role == 'material'
      can :view, :site
      can :view, :charcoals
      can :create, :charcoals
      can :edit, :charcoals
      can :manage, :charcoal_inspector
      can :manage, :material_suppliers
      can :search, :silicon_daily_report
    end
    
    
    if user.role == 'warehouse_manager'
      can :view, :site
      can :view, :index_silicons
      can :manage, :warehouse
      can :manage, :warehouse_suppliers
      can :manage, :warehouse_items
      can :edit, :microsilicas
      can :manage, :ms_shippments
      can :edit, :ms_location
      #      can :manage, :silicon_ship
      #      can :edit, :silicon_ship
      #      can :create, :silicon_ship
      can :print, :ms_loading
      can :manage, :pickings
      can :manage, :si_inventory
      can :create, :dailyreport
      can :edit, :dailyreport
      can :view, :dailyreport
      can :manage, :vehicles
      can :manage, :warehouse_checkin
      can :create, :hr_ot
      can :view, :quartzs
      can :view, :charcoals
      can :edit, :charcoals
      can :create,:charcoal_partical_test
      can :manage, :ms_bags 
      can :confirm, :purchase
      can :search, :silicons
      can :search, :silicon_period_report
      can :search, :silicon_daily_report
      # si_inventory module
      
      can :view, :si_inventory 
      ## access main page
      
      can :view, :si_inventory_report 
      ## access report page
      
      #can :edit, :si_inventory 
      ## show edit button
      
      can :create, :si_inventory_bags 
      ## create multiple bags
      
      can :edit, :si_inventory_bag_location 
      ## show warehousing button and edit bags location
  
      # silicon_metal_mix_bag module
      can :edit, :silicon_metal_mix_bag
      can :edit, :silicon_metal_mix_bag_location
      
    end
    
    if user.role == 'warehouse_master'
      can :view, :site
      can :view, :index_silicons
      can :manage, :warehouse
      can :manage, :departments
      can :manage, :warehouse_suppliers
      can :manage, :warehouse_items
      can :edit, :microsilicas
      can :manage, :ms_shippments
      can :edit, :ms_location
      can :search, :silicon_period_report
      can :search, :silicon_daily_report
      #      can :manage, :silicon_ship
      #      can :edit, :silicon_ship
      #      can :create, :silicon_ship
      can :print, :ms_loading
      can :manage, :pickings
      can :manage, :si_inventory
      can :create, :dailyreport
      can :edit, :dailyreport
      can :view, :dailyreport
      can :manage, :vehicles
      can :create, :hr_ot
      can :view, :charcoals
      can :edit, :charcoals
      can :create,:charcoal_partical_test
      can :manage, :ms_bags
      can :manage, :warehouse_checkin
    end
    
    if user.role == 'warehouse_staff'
      can :view, :site
      can :manage, :warehouse
      can :manage, :warehouse_suppliers
      can :manage, :warehouse_items
      can :print, :material_forcast
      can :search, :silicons
      can :edit, :microsilicas
      can :edit, :ms_location
      can :view, :microsilicas
      can :create, :ms_shippments
      can :edit, :ms_shippments
      can :search, :silicon_period_report
      can :search, :silicon_daily_report
      #      can :view, :silicon_ship
      #      can :edit, :silicon_ship
      #      can :create, :silicon_ship
      can :print, :ms_loading
      can :create, :pickings
      can :edit, :pickings
      can :view, :pickings
      
      can :manage, :vehicles
      can :view, :charcoals
      can :edit, :charcoals
      can :create,:charcoal_partical_test
      can :manage, :ms_bags
      can :manage, :warehouse_checkin
  
      # si_inventory module
      
      can :view, :si_inventory 
      ## access main page
      
      can :view, :si_inventory_report 
      ## access report page
      
      #can :edit, :si_inventory 
      ## show edit button
      
      can :create, :si_inventory_bags 
      ## create multiple bags
      
      can :edit, :si_inventory_bag_location 
      ## show warehousing button and edit bags location
  
      # silicon_metal_mix_bag module
      can :create, :silicon_metal_mix_bag #for packing
      can :edit, :silicon_metal_mix_bag #for packing
      can :edit, :silicon_metal_mix_bag_content #for packing
      
      can :edit, :silicon_metal_mix_bag
      can :edit, :silicon_metal_mix_bag_location
      
    end # end of warehouse staff
    
    if user.role == 'prod_packing'
      can :view, :site
      
      # si_inventory module
      can :view, :si_inventory # access main page
      can :view, :si_inventory_report # access report page
      can :edit, :si_inventory # showing the edit button
      can :edit, :si_inventory_bag_contents # edit bags contents
      can :print, :si_inventory_report
      can :search, :silicons
      can :search, :silicon_period_report
      can :search, :silicon_daily_report
      can :create, :silicon_metal_mix_bag
      can :edit, :silicon_metal_mix_bag
      can :edit, :silicon_metal_mix_bag_content
    end
    
    if user.role == 'it_staff'
      can :view, :site
      can :edit, :it
      can :create, :it_devices
      can :edit, :it_devices
      can :view, :it_devices
      can :manage, :it_reservations
    end
    
    if user.role == 'marketing'
      can :view, :site
      can :view, :charcoals
      can :view, :silicons
      can :search, :silicons
      can :manage, :marketing
      can :edit, :complain
      can :edit, :ms_samples
      can :manage, :sampleresults
      can :search, :silicon_period_report
      can :search, :silicon_daily_report
      can :manage, :ms_loading
      can :manage, :po
    end
    
    if user.role=='microsilica_staff'
      can :view, :site
      can :create, :env_monitor
      can :edit, :env_monitor
      can :view, :env_monitor
      can :create, :silos
      can :edit, :silos
      can :view, :silos
      can :create, :microsilicas
      can :edit, :microsilicas
      can :view, :microsilicas
      can :create, :ms_samples
      can :edit, :ms_samples
    end
    
    if user.role=='microsilica_master'
      can :view, :site
      can :view, :index_silicons
      can :manage, :env_monitor
      can :manage, :silos
      can :manage, :microsilicas
      can :manage, :ms_samples
      can :manage, :ms_shippments
    end
    
    if user.role=='microsilica_manager'
      can :view, :site
      can :view, :index_silicons
      can :manage, :env_monitor
      can :manage, :silos
      can :manage, :microsilicas
      can :manage, :ms_samples
      can :manage, :ms_shippments
      can :manage, :ms_production_confirm
      can :search, :silicon_period_report
      can :search, :silicon_daily_report
      can :create, :dailyreport
      can :edit, :dailyreport
      can :view, :dailyreport
      can :create, :hr_ot
    end
    
    if user.role=='oxygen_staff'
      can :view, :site
      can :manage, :oxygens
    end
    
    if user.role=='HR_Manager'
      can :manage, :departments
      can :view, :site
      can :view, :index_silicons
      can :manage, :hr
      can :create, :dailyreport
      can :edit, :dailyreport
      can :view, :dailyreport
      can :manage, :hr_ot
      can :upload, :hr_att
      can :manage,:security
      can :search, :silicon_period_report
      can :search, :silicon_daily_report
    end
    
    if user.role=='HR_Staff'
      can :manage, :departments
      can :view, :site
      can :manage, :hr
      can :create, :dailyreport
      can :edit, :dailyreport
      can :view, :dailyreport
      can :view, :furnace
      can :create, :furnace
      can :edit, :furnace
      can :upload, :hr_att
      
    end
    
    if user.role=='accounting_staff'
      can :view, :site
      can :view, :index_silicons
      can :manage, :payments
      can :search, :silicon_period_report
      can :search, :silicon_daily_report
    end
     
    if user.role == 'facility_manager'
      can :view, :site
      can :view, :index_silicons
      can :view, :charcoals
      can :view, :silicons
      can :view, :markering
      can :view, :env_monitor
      can :view, :silos
      can :view, :microsilicas
      can :view, :ms_samples
      can :view, :ms_shippments
      can :view, :ms_production_confirm
      can :search, :silicons
      can :search, :silicon_period_report
      can :search, :silicon_daily_report
      can :create, :dailyreport
      can :edit, :dailyreport
      can :view, :dailyreport
      can :view, :warehouse_items
      can :view, :all
      
      can :create, :hr_ot
      can :manage, :power
    end
    
    if user.role=='Security'
      can :view, :site
      can :view, :index_silicons
      can :manage, :security
      can :create, :dailyreport
      can :edit, :dailyreport
      can :view, :dailyreport
    end
    
    if user.role=='Furnace'
      can :view, :site
      can :view, :index_silicons
      can :view, :charcoals
      can :view, :quartzs
      can :create, :dailyreport
      can :edit, :dailyreport
      can :view, :dailyreport
      can :manage, :furnace
      can :search, :silicon_period_report
      can :search, :silicon_daily_report
      can :create, :power
      can :edit, :power
      can :view, :power
      can :print, :silicon_daily_report
    end
    
    
    if user.role=='Purchase_staff'
      can :view, :site
      can :view, :index_silicons
      can :view, :charcoals
      can :view, :warehouse_items
      can :search, :charcoals
      # can :confirm, :purchase
      can :edit, :purchase
      can :plan, :purchase
      can :finish, :purchase
      can :manage, :purchase
      can :manage, :purchase_location
      can :manage, :unit
      
    end
    
    if user.role=='Purchase_manager'
      can :view, :site
      can :view, :index_silicons
      can :view, :all
      can :search, :all
      can :manage, :purchase
      can :manage, :purchase_location
      can :create, :hr_ot
      can :manage, :unit
    end
    
  end
end

# Define abilities for the passed in user here. For example:
#
#   user ||= User.new # guest user (not logged in)
#   if user.admin?
#     can :manage, :all
#   else
#     can :read, :all
#   end
#
# The first argument to `can` is the action you are giving the user permission to do.
# If you pass :manage it will apply to every action. Other common actions here are
# :read, :create, :update and :destroy.
#
# The second argument is the resource the user can perform the action on. If you pass
# :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
#
# The third argument is an optional hash of conditions to further filter the objects.
# For example, here the user can only update published articles.
#
#   can :update, Article, :published => true
#
# See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities

             