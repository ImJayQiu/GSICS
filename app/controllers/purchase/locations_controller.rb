class Purchase::LocationsController < ApplicationController
  # GET /purchase/locations
  # GET /purchase/locations.xml
  def index
    @purchase_locations = Purchase::Location.paginate :page => params[:page], :order => 'name, created_at',:per_page => 50

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @purchase_locations }
    end
  end

  # GET /purchase/locations/1
  # GET /purchase/locations/1.xml
  def show
    @purchase_location = Purchase::Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @purchase_location }
    end
  end

  # GET /purchase/locations/new
  # GET /purchase/locations/new.xml
  def new
    @purchase_location = Purchase::Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @purchase_location }
    end
  end

  # GET /purchase/locations/1/edit
  def edit
    @purchase_location = Purchase::Location.find(params[:id])
  end

  # POST /purchase/locations
  # POST /purchase/locations.xml
  def create
    params.permit!
    @purchase_location = Purchase::Location.new(params[:purchase_location])

    respond_to do |format|
      if @purchase_location.save
        format.html { redirect_to(@purchase_location, :notice => 'Location was successfully created.') }
        format.xml  { render :xml => @purchase_location, :status => :created, :location => @purchase_location }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @purchase_location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /purchase/locations/1
  # PUT /purchase/locations/1.xml
  def update
    params.permit!
    @purchase_location = Purchase::Location.find(params[:id])

    respond_to do |format|
      if @purchase_location.update_attributes(params[:purchase_location])
        format.html { redirect_to(@purchase_location, :notice => 'Location was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @purchase_location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase/locations/1
  # DELETE /purchase/locations/1.xml
  def destroy
    @purchase_location = Purchase::Location.find(params[:id])
    @purchase_location.destroy

    respond_to do |format|
      format.html { redirect_to(purchase_locations_url) }
      format.xml  { head :ok }
    end
  end
end
