#coding = utf-8

class SiInventoriesController < ApplicationController
  # GET /si_inventories
  # GET /si_inventories.xml
  
  layout 'main', :except =>[:warehouse_edit]  
  
  def index
    @si_inventories = SiInventory.paginate :page => params[:page], :order => ' date DESC, furnace, shift, no, bag, bag_no DESC', :per_page => 30

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @si_inventories }
    end
  end

  # GET /si_inventories/1
  # GET /si_inventories/1.xml
  def show
    @si_inventory = SiInventory.find(params[:id])
    @bag_no="GS-"+@si_inventory.furnace+"-"+@si_inventory.date.strftime("%y%m%d")+"-"+@si_inventory.shift+"-"+@si_inventory.no+"-"+@si_inventory.bag rescue nil

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @si_inventory }
    end
  end

  # GET /si_inventories/new
  # GET /si_inventories/new.xml
  
  def new
    #qty = params[:qty].to_i
    #@si_inventories = Array.new(qty) {SiInventory.new}
   
    @si_inventory = SiInventory.new
    
    #@date_selected = params[:date]

    @monthly_bags = SiInventory.where(:date=>Date.today.at_beginning_of_month)
    
    #@monthly_bags_count = @monthly_bags.count
    
    if @monthly_bags.nil?
      @bag_no_new = (Date.today.strftime('%y%m')+"00001").to_i
    elsif SiInventory.last.bag_no.nil?
      @bag_no_new = (Date.today.strftime('%y%m')+"00001").to_i
    else
      @bag_no_new = SiInventory.last.bag_no.to_i+1
    end

    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @si_inventory }
    end
  end

  # GET /si_inventories/1/edit
  def edit
    @si_inventory = SiInventory.find(params[:id])
    @bag_no_new = @si_inventory.bag_no
  end

  def warehouse_edit
    @si_inventory = SiInventory.find(params[:id])
    @bag_no_new = @si_inventory.bag_no
    @bag_no="GS-"+@si_inventory.furnace+"-"+@si_inventory.date.strftime("%y%m%d")+"-"+@si_inventory.shift+"-"+@si_inventory.no+"-"+@si_inventory.bag rescue nil

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @si_inventory }
    end
    
  end
  
  # POST /si_inventories
  # POST /si_inventories.xml
  def create
    
    params.permit!
    
    @si_inventory = SiInventory.new(params[:si_inventory])
    #@si_inventories = params[:si_inventory].values.collect {|si| SiInventory.new(si) }
    
    
    respond_to do |format|
      if @si_inventory.save
        format.html { redirect_to(@si_inventory, :notice => 'Si inventory was successfully created.') }
        format.xml  { render :xml => @si_inventory, :status => :created, :location => @si_inventory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @si_inventory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /si_inventories/1
  # PUT /si_inventories/1.xml
  def update
    params.permit!
    @si_inventory = SiInventory.find(params[:id])

    respond_to do |format|
      if @si_inventory.update_attributes(params[:si_inventory])
        format.html { redirect_to(@si_inventory, :notice => 'Si inventory was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @si_inventory.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  

  # DELETE /si_inventories/1
  # DELETE /si_inventories/1.xml
  
  def destroy
    @si_inventory = SiInventory.find(params[:id])
    @si_inventory.destroy

    respond_to do |format|
      format.html { redirect_to(si_inventories_url) }
      format.xml  { head :ok }
    end
  end
  
  ################### End of Destroy ###############################
  
  def si_inventory_report
  
    #判断日期
    # if params[:start_date] && params[:end_date]   
    @start_date = params[:start_date].to_date
    @end_date = params[:end_date].to_date
    @date_period = @start_date..@end_date
    
    @start_datetime = params[:start_date].to_datetime - 1.days
    @end_datetime = params[:end_date].to_datetime + 1.days
    @datetime_period=@start_datetime..@end_datetime
    #end # end of if date
    
    #判断炉号
    if params[:furnace] == ""
      @furnace = 0..10
      @furnace_name = "所 有 硅 炉 | All Furnaces"
    else      
      @furnace = params[:furnace]
      @furnace_name = @furnace  
    end
    
    #判断班别
    if params[:shift] == ""
      @shift = 1..3
      @shift_name = "所 有 班 别 | All Shifts"
    else      
      @shift = params[:shift]
      @shift_name = @shift  
    end
    
    if params[:date_type] == "Store|入库日期"
      @si_bags = SiInventory.includes(:si_inventory_contents).where( "wh_date >= ? AND wh_date <= ? AND weight <> ? ", @start_date, @end_date, "" ) #:wh_date=>@date_period, :weight=>:present )#, :furnace=>@furnace, :shift=>@shift)
    else
      @si_bags = SiInventory.includes(:si_inventory_contents).where( "date >= ? AND date <= ? AND weight <> ? ", @start_date, @end_date, "" )  #(:date=>@date_period, :weight=>:present ) #, :furnace=>@furnace, :shift=>@shift)
    end
    
   
    @si_bags_ids = @si_bags.collect(& :id).uniq
    
    #@si_bags = SiInventory.where(:id=>@si_bags_ids)
    
    @si_contents = SiInventoryContent.where(:si_inventory_id=>@si_bags_ids)
    
    if @date_period.first == @date_period.last
      @date_selected=@date_period.first
    else
      @date_selected = @date_period
    end
    
    @total_weight = @si_bags.collect(& :weight).sum rescue nil
    
    @grades = @si_bags.group_by{ |s|s.grade }
    
    @employee_group = @si_contents.group_by{|s|s.employee_code}
    
    
  end # end of def si_inventory_report

  
  def multiple_bags
    
    date = params[:date]
    @date_selected = date.to_date
    
    @quantity = params[:qty].to_i
    @index = 0..(@quantity-1)

    monthly_bags = SiInventory.where(:date=>@date_selected.beginning_of_month..@date_selected.end_of_month)
    
    if monthly_bags.count > 0
      @bag_no_new = monthly_bags[-1].bag_no.to_i+1
    else
      @bag_no_new = (@date_selected.strftime('%y%m')+"00001").to_i
    end
    
    bags = []
    
    @operator_now = current_user.username
    @quantity.times do |index|
      i=index.to_i # [0.....i]
      bags << SiInventory.new(
        date: @date_selected, 
        bag_no: (@bag_no_new+i), 
        operator: @operator_now
      )
    end

    SiInventory.import bags
  
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @si_inventory }
    end

  end

end # end of class
