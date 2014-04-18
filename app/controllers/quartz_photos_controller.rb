class QuartzPhotosController < ApplicationController
  # GET /quartz_photos
  # GET /quartz_photos.xml
  def index
    @quartz_photos = QuartzPhoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quartz_photos }
    end
  end

  # GET /quartz_photos/1
  # GET /quartz_photos/1.xml
  def show
    @quartz_photo = QuartzPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quartz_photo }
    end
  end

  # GET /quartz_photos/new
  # GET /quartz_photos/new.xml
  def new
    @quartz_photo = QuartzPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quartz_photo }
    end
  end

  # GET /quartz_photos/1/edit
  def edit
    @quartz_photo = QuartzPhoto.find(params[:id])
  end

  # POST /quartz_photos
  # POST /quartz_photos.xml
  def create
    params.permit!
    @quartz_photo = QuartzPhoto.new(params[:quartz_photo])

    respond_to do |format|
      if @quartz_photo.save
        format.html { redirect_to(@quartz_photo, :notice => 'Quartz photo was successfully created.') }
        format.xml  { render :xml => @quartz_photo, :status => :created, :location => @quartz_photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quartz_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quartz_photos/1
  # PUT /quartz_photos/1.xml
  def update
    params.permit!
    @quartz_photo = QuartzPhoto.find(params[:id])

    respond_to do |format|
      if @quartz_photo.update_attributes(params[:quartz_photo])
        format.html { redirect_to(@quartz_photo, :notice => 'Quartz photo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quartz_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quartz_photos/1
  # DELETE /quartz_photos/1.xml
  def destroy
    @quartz_photo = QuartzPhoto.find(params[:id])
    @quartz_photo.destroy

    respond_to do |format|
      format.html { redirect_to(quartz_photos_url) }
      format.xml  { head :ok }
    end
  end
end
