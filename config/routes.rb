Qcss::Application.routes.draw do


  namespace :silicon_metal do
    resources :gpos
  end

  namespace :silicon_metal do
    resources :pos
  end

  namespace :silicon_metal do
    resources :si_shippings
  end

#  namespace :silicon_metal do
#    
#  end

  namespace :silicon_metal do
    resources :mix_bags
    resources :mix_bag_contents
  end

  namespace :purchase do
    resources :units
  end

  namespace :warehouse do
    resources :checkins
  end

  namespace :hr do resources :subcompanies end

  namespace :hr do resources :positions end

  namespace :hr do resources :dept_changes end

  namespace :ms do resources :bag_inventories end

  namespace :ms do resources :bags end

  namespace :hr do 
    resources :attendences do
      collection { post :import }
      collection do
        get :summary
      end
    end
  end
      
  
  namespace :power do resources :factors end

  namespace :power do resources :furnaces end

  namespace :power do 
    resources :totals do
      collection do
        get :summary
      end
    end 
  end

  namespace :hr do
    resources :otms do
      collection do
        get :summary
      end
    end
  end

  namespace :purchase do resources :locations end

  namespace :purchase do 
    resources :requests do
      collection do
        get :plan
        get :reject
        get :finish
        get :warehouse
        get :warehoused
        get :trace
        get :p_confirm
        get :all
      end
    end
  end
  
  namespace :purchase do resources :request_photos end

  resources :e_furnaces do
    collection do
      get :summary
    end
  end

  resources :rm_rates

  resources :security_case_media

  resources :security_cases

  resources :ms_reworks

  resources :vehicle_requests do
    collection do 
      get :planning
    end
  end

  resources :v_netweights

  resources :vehicle_dailies

  resources :weightings do
    collection do
      get :summary
    end
  end

  resources :vehicles

  resources :dailyreport_jobs

  resources :dailyreports do
    collection do
      get :daily_summary
    end
  end

  namespace :interviews do resources :its end

  resources :destinations

  resources :freights

  resources :payments

  resources :partical_sizes

  resources :po_controls do
    collection do
      get :po_search_result
    end
  end

  resources :ms_offgrades

  resources :si_inventory_contents

  resources :si_inventories do
    collection do
      get :si_inventory_report
      get :multiple_bags
      post :create_multiple
    end
  end

  resources :pickings

  resources :warehouse_item_photos

  resources :employeer_photos

  resources :employeers

  resources :it_reservations

  resources :quartz_photos

  resources :quartzs

  resources :ms_loadings do
    collection do
      get :loading_summary_search_result
    end
  end

  resources :ms_losses

  get "impress/microsilica"

  resources :ms_prod_confirms

  resources :silicashiplots

  resources :silicaships

  resources :sampleresults

  resources :oxygens

  resources :msshipbags

  resources :msshiplots

  resources :ms_shippments

  resources :charcoal_dusts

  resources :mssamples

  resources :samples

  resources :en_certifies

  resources :microsilicas

  resources :silos

  resources :env_monitors

  resources :it_devices

  resources :customers

  resources :complains

  resources :it_repairs

  resources :categories

  resources :departments

  resources :warehouse_suppliers

  resources :warehouse_items

  resources :suppliers

  resources :charcoals

  resources :coasilicons

  get "analysis/silicon"

  get "reports/daily"

  get "reports/period"
  
  get "reports/charcoalsum"

  get "summary/index"

  get "site/index"
  

  devise_for :users
  resources :users 
  resources :grades

  resources :silicons
  resources :coas
  


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "site#index"

  #map.connect ':controller/:action/:id'
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  get ':controller(/:action(/:id(.:format)))'
  
end
