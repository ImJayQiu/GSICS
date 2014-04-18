class CreatePurchaseRequests < ActiveRecord::Migration
  def self.up
    create_table :purchase_requests do |t|
      # 1. Submit basic Info of purchase
      t.string :code # Purchase Request code
      t.date :date # to identify the submit date
      t.string :p_type # Purcahse type eg. Office, Silicon, FeSi
      t.string :name # Person who submit this request
      t.string :dept # The department of the person who submit this request
      t.string :i_name # Purchase item name
      t.integer :qty # Purchase Quantity
      t.string :estimate_price # Price Range
      t.string :location # Where to purchase
      t.date :deadline # Purchase deadline
      t.string :remark # Remark
      t.string :note # note by purchase staff 
      t.string :p_note # the person of save note
      t.datetime :p_note_date # the date of save note
      t.string :unit # select purchase unit
      
      # 2. Purchase Confirmation
      t.string :confirm # Manager Confirm
      t.date :confirm_date # Date of Manager Confirm
      t.string :p_confirm # Purchase Manager Confirm
      t.date :p_confirm_date # Date Purchase Manager Confirm
      
      # 3. Reject purchase request or make purchase plan
      t.date :p_date # Purchase Plan Date
      t.string :p_date_operator # The name of the person who plan the purchase
      t.date :p_submit_date # When made the plan
      t.string :reject # Reasons of Rejection
 
      # 4. Finishing purchase
      t.date :a_date # Actual Purchase Date
      t.integer :a_qty # Actual Purchase Quantity
      t.string :a_price # Actual Purchase Price
      t.date :a_finish_date # Submit Date of Finishing Purchase
      t.string :a_finish_remark # Remark of ifnish purchase
      
      # 5. Warehouse confirm
      t.string :wh_confirm # Warehouse Confirm 
      t.date :wh_date # Warehousing Date
      t.string :wh_location # Warehousing Location
      t.date :wh_submit_date # Warehousing Submit Date
      t.string :item_code # Code of the item in warehouse
      t.date :wh_reject_date # Date of rejection by warehouse
      t.string :wh_reject_note # Note of rejection by warehouse
      t.string :wh_reject_operator # Person of rejection by warehouse
      
      t.string :cancel # to mark if this form is canceled
      
      t.timestamps
    end
  end

  def self.down
    drop_table :purchase_requests
  end
end
