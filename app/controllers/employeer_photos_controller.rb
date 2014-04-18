class EmployeerPhotosController < ApplicationController
  # GET /employeer_photos
  # GET /employeer_photos.xml
  def index
    @employeer_photos = EmployeerPhoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employeer_photos }
    end
  end

  # GET /employeer_photos/1
  # GET /employeer_photos/1.xml
  def show
    @employeer_photo = EmployeerPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employeer_photo }
    end
  end

  # GET /employeer_photos/new
  # GET /employeer_photos/new.xml
  def new
    @employeer_photo = EmployeerPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employeer_photo }
    end
  end

  # GET /employeer_photos/1/edit
  def edit
    @employeer_photo = EmployeerPhoto.find(params[:id])
  end

  # POST /employeer_photos
  # POST /employeer_photos.xml
  def create
    params.permit!
    @employeer_photo = EmployeerPhoto.new(params[:employeer_photo])

    respond_to do |format|
      if @employeer_photo.save
        format.html { redirect_to(@employeer_photo, :notice => 'Employeer photo was successfully created.') }
        format.xml  { render :xml => @employeer_photo, :status => :created, :location => @employeer_photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employeer_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employeer_photos/1
  # PUT /employeer_photos/1.xml
  def update
    params.permit!
    @employeer_photo = EmployeerPhoto.find(params[:id])

    respond_to do |format|
      if @employeer_photo.update_attributes(params[:employeer_photo])
        format.html { redirect_to(@employeer_photo, :notice => 'Employeer photo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employeer_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /employeer_photos/1
  # DELETE /employeer_photos/1.xml
  def destroy
    @employeer_photo = EmployeerPhoto.find(params[:id])
    @employeer_photo.destroy

    respond_to do |format|
      format.html { redirect_to(employeer_photos_url) }
      format.xml  { head :ok }
    end
  end
end
