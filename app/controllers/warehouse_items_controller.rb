class WarehouseItemsController < ApplicationController
  # GET /warehouse_items
  # GET /warehouse_items.xml
  
  # coding: utf-8  
  
  def index
    @warehouse_items = WarehouseItem.paginate :page => params[:page], :order => 'c_type, dept, code',:per_page => 50

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @warehouse_items }
    end
  end

  # GET /warehouse_items/1
  # GET /warehouse_items/1.xml
  def show
    @warehouse_item = WarehouseItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @warehouse_item }
    end
  end

  # GET /warehouse_items/new
  # GET /warehouse_items/new.xml
  def new
    @warehouse_item = WarehouseItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @warehouse_item }
    end
  end

  # GET /warehouse_items/1/edit
  def edit
    @warehouse_item = WarehouseItem.find(params[:id])
  end

  # POST /warehouse_items
  # POST /warehouse_items.xml
  def create
    params.permit!
    @warehouse_item = WarehouseItem.new(params[:warehouse_item])

    respond_to do |format|
      if @warehouse_item.save
        format.html { redirect_to(@warehouse_item, :notice => 'Warehouse item was successfully created.') }
        format.xml  { render :xml => @warehouse_item, :status => :created, :location => @warehouse_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @warehouse_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /warehouse_items/1
  # PUT /warehouse_items/1.xml
  def update
    params.permit!
    @warehouse_item = WarehouseItem.find(params[:id])

    respond_to do |format|
      if @warehouse_item.update_attributes(params[:warehouse_item])
        format.html { redirect_to(@warehouse_item, :notice => 'Warehouse item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @warehouse_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /warehouse_items/1
  # DELETE /warehouse_items/1.xml
  def destroy
    @warehouse_item = WarehouseItem.find(params[:id])
    @warehouse_item.destroy

    respond_to do |format|
      format.html { redirect_to(warehouse_items_url) }
      format.xml  { head :ok }
    end
  end
end
