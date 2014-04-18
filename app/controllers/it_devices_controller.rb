class ItDevicesController < ApplicationController
  # GET /it_devices
  # GET /it_devices.xml
  def index
    @it_devices = ItDevice.all :order => "code" 

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @it_devices }
    end
  end

  # GET /it_devices/1
  # GET /it_devices/1.xml
  def show
    @it_device = ItDevice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @it_device }
    end
  end

  # GET /it_devices/new
  # GET /it_devices/new.xml
  def new
    @it_device = ItDevice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @it_device }
    end
  end

  # GET /it_devices/1/edit
  def edit
    @it_device = ItDevice.find(params[:id])
  end

  # POST /it_devices
  # POST /it_devices.xml
  def create
    params.permit!
    @it_device = ItDevice.new(params[:it_device])

    respond_to do |format|
      if @it_device.save
        format.html { redirect_to(@it_device, :notice => 'It device was successfully created.') }
        format.xml  { render :xml => @it_device, :status => :created, :location => @it_device }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @it_device.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /it_devices/1
  # PUT /it_devices/1.xml
  def update
    params.permit!
    @it_device = ItDevice.find(params[:id])

    respond_to do |format|
      if @it_device.update_attributes(params[:it_device])
        format.html { redirect_to(@it_device, :notice => 'It device was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @it_device.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /it_devices/1
  # DELETE /it_devices/1.xml
  def destroy
    @it_device = ItDevice.find(params[:id])
    @it_device.destroy

    respond_to do |format|
      format.html { redirect_to(it_devices_url) }
      format.xml  { head :ok }
    end
  end
end
