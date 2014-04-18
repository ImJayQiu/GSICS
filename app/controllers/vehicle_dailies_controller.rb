class VehicleDailiesController < ApplicationController
  # GET /vehicle_dailies
  # GET /vehicle_dailies.xml
  def index
    @vehicle_dailies = VehicleDaily.paginate :page => params[:page], :order => 'created_at DESC',:per_page =>30

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vehicle_dailies }
    end
  end

  # GET /vehicle_dailies/1
  # GET /vehicle_dailies/1.xml
  def show
    @vehicle_daily = VehicleDaily.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vehicle_daily }
    end
  end

  # GET /vehicle_dailies/new
  # GET /vehicle_dailies/new.xml
  def new
    @vehicle_daily = VehicleDaily.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vehicle_daily }
    end
  end

  # GET /vehicle_dailies/1/edit
  def edit
    @vehicle_daily = VehicleDaily.find(params[:id])
  end

  # POST /vehicle_dailies
  # POST /vehicle_dailies.xml
  def create
    params.permit!
    @vehicle_daily = VehicleDaily.new(params[:vehicle_daily])

    respond_to do |format|
      if @vehicle_daily.save
        format.html { redirect_to(@vehicle_daily, :notice => 'Vehicle daily was successfully created.') }
        format.xml  { render :xml => @vehicle_daily, :status => :created, :location => @vehicle_daily }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vehicle_daily.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vehicle_dailies/1
  # PUT /vehicle_dailies/1.xml
  def update
    params.permit!
    @vehicle_daily = VehicleDaily.find(params[:id])

    respond_to do |format|
      if @vehicle_daily.update_attributes(params[:vehicle_daily])
        format.html { redirect_to(@vehicle_daily, :notice => 'Vehicle daily was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vehicle_daily.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_dailies/1
  # DELETE /vehicle_dailies/1.xml
  def destroy
    @vehicle_daily = VehicleDaily.find(params[:id])
    @vehicle_daily.destroy

    respond_to do |format|
      format.html { redirect_to(vehicle_dailies_url) }
      format.xml  { head :ok }
    end
  end
end
