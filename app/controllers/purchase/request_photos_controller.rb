class Purchase::RequestPhotosController < ApplicationController
  # GET /purchase/request_photos
  # GET /purchase/request_photos.xml
  def index
    @purchase_request_photos = Purchase::RequestPhoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @purchase_request_photos }
    end
  end

  # GET /purchase/request_photos/1
  # GET /purchase/request_photos/1.xml
  def show
    @purchase_request_photo = Purchase::RequestPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @purchase_request_photo }
    end
  end

  # GET /purchase/request_photos/new
  # GET /purchase/request_photos/new.xml
  def new
    @purchase_request_photo = Purchase::RequestPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @purchase_request_photo }
    end
  end

  # GET /purchase/request_photos/1/edit
  def edit
    @purchase_request_photo = Purchase::RequestPhoto.find(params[:id])
  end

  # POST /purchase/request_photos
  # POST /purchase/request_photos.xml
  def create
    params.permit!
    @purchase_request_photo = Purchase::RequestPhoto.new(params[:purchase_request_photo])

    respond_to do |format|
      if @purchase_request_photo.save
        format.html { redirect_to(@purchase_request_photo, :notice => 'Request photo was successfully created.') }
        format.xml  { render :xml => @purchase_request_photo, :status => :created, :location => @purchase_request_photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @purchase_request_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /purchase/request_photos/1
  # PUT /purchase/request_photos/1.xml
  def update
    params.permit!
    @purchase_request_photo = Purchase::RequestPhoto.find(params[:id])

    respond_to do |format|
      if @purchase_request_photo.update_attributes(params[:purchase_request_photo])
        format.html { redirect_to(@purchase_request_photo, :notice => 'Request photo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @purchase_request_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase/request_photos/1
  # DELETE /purchase/request_photos/1.xml
  def destroy
    @purchase_request_photo = Purchase::RequestPhoto.find(params[:id])
    @purchase_request_photo.destroy

    respond_to do |format|
      format.html { redirect_to(purchase_request_photos_url) }
      format.xml  { head :ok }
    end
  end
end
