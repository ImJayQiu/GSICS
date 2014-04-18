class WarehouseItemPhotosController < ApplicationController
  # GET /warehouse_item_photos
  # GET /warehouse_item_photos.xml
  def index
    @warehouse_item_photos = WarehouseItemPhoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @warehouse_item_photos }
    end
  end

  # GET /warehouse_item_photos/1
  # GET /warehouse_item_photos/1.xml
  def show
    @warehouse_item_photo = WarehouseItemPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @warehouse_item_photo }
    end
  end

  # GET /warehouse_item_photos/new
  # GET /warehouse_item_photos/new.xml
  def new
    @warehouse_item_photo = WarehouseItemPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @warehouse_item_photo }
    end
  end

  # GET /warehouse_item_photos/1/edit
  def edit
    @warehouse_item_photo = WarehouseItemPhoto.find(params[:id])
  end

  # POST /warehouse_item_photos
  # POST /warehouse_item_photos.xml
  def create
    params.permit!
    @warehouse_item_photo = WarehouseItemPhoto.new(params[:warehouse_item_photo])

    respond_to do |format|
      if @warehouse_item_photo.save
        format.html { redirect_to(@warehouse_item_photo, :notice => 'Warehouse item photo was successfully created.') }
        format.xml  { render :xml => @warehouse_item_photo, :status => :created, :location => @warehouse_item_photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @warehouse_item_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /warehouse_item_photos/1
  # PUT /warehouse_item_photos/1.xml
  def update
    params.permit!
    @warehouse_item_photo = WarehouseItemPhoto.find(params[:id])

    respond_to do |format|
      if @warehouse_item_photo.update_attributes(params[:warehouse_item_photo])
        format.html { redirect_to(@warehouse_item_photo, :notice => 'Warehouse item photo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @warehouse_item_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /warehouse_item_photos/1
  # DELETE /warehouse_item_photos/1.xml
  def destroy
    @warehouse_item_photo = WarehouseItemPhoto.find(params[:id])
    @warehouse_item_photo.destroy

    respond_to do |format|
      format.html { redirect_to(warehouse_item_photos_url) }
      format.xml  { head :ok }
    end
  end
end
