class Ms::BagInventoriesController < ApplicationController
  # GET /ms/bag_inventories
  # GET /ms/bag_inventories.xml
  def index
    @ms_bag_inventories = Ms::BagInventory.paginate :page => params[:page], :order => 'date DESC', :per_page => 30

    @ms_bag_type_group = @ms_bag_inventories.group_by {|m|m.bag_type}
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ms_bag_inventories }
    end
  end

  # GET /ms/bag_inventories/1
  # GET /ms/bag_inventories/1.xml
  def show
    @ms_bag_inventory = Ms::BagInventory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ms_bag_inventory }
    end
  end

  # GET /ms/bag_inventories/new
  # GET /ms/bag_inventories/new.xml
  def new
    @ms_bag_inventory = Ms::BagInventory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ms_bag_inventory }
    end
  end

  # GET /ms/bag_inventories/1/edit
  def edit
    @ms_bag_inventory = Ms::BagInventory.find(params[:id])
  end

  # POST /ms/bag_inventories
  # POST /ms/bag_inventories.xml
  def create
    params.permit!
    @ms_bag_inventory = Ms::BagInventory.new(params[:ms_bag_inventory])

    respond_to do |format|
      if @ms_bag_inventory.save
        format.html { redirect_to(@ms_bag_inventory, :notice => 'Bag inventory was successfully created.') }
        format.xml  { render :xml => @ms_bag_inventory, :status => :created, :location => @ms_bag_inventory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ms_bag_inventory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ms/bag_inventories/1
  # PUT /ms/bag_inventories/1.xml
  def update
    params.permit!
    @ms_bag_inventory = Ms::BagInventory.find(params[:id])

    respond_to do |format|
      if @ms_bag_inventory.update_attributes(params[:ms_bag_inventory])
        format.html { redirect_to(@ms_bag_inventory, :notice => 'Bag inventory was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ms_bag_inventory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ms/bag_inventories/1
  # DELETE /ms/bag_inventories/1.xml
  def destroy
    @ms_bag_inventory = Ms::BagInventory.find(params[:id])
    @ms_bag_inventory.destroy

    respond_to do |format|
      format.html { redirect_to(ms_bag_inventories_url) }
      format.xml  { head :ok }
    end
  end
end
