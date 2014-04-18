class Power::FurnacesController < ApplicationController
  # GET /power/furnaces
  # GET /power/furnaces.xml
  def index
    @power_furnaces = Power::Furnace.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @power_furnaces }
    end
  end

  # GET /power/furnaces/1
  # GET /power/furnaces/1.xml
  def show
    @power_furnace = Power::Furnace.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @power_furnace }
    end
  end

  # GET /power/furnaces/new
  # GET /power/furnaces/new.xml
  def new
    @power_furnace = Power::Furnace.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @power_furnace }
    end
  end

  # GET /power/furnaces/1/edit
  def edit
    
    @power_furnace = Power::Furnace.find(params[:id])
  end

  # POST /power/furnaces
  # POST /power/furnaces.xml
  def create
    params.permit!
    @power_furnace = Power::Furnace.new(params[:power_furnace])

    respond_to do |format|
      if @power_furnace.save
        format.html { redirect_to(@power_furnace, :notice => 'Furnace was successfully created.') }
        format.xml  { render :xml => @power_furnace, :status => :created, :location => @power_furnace }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @power_furnace.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /power/furnaces/1
  # PUT /power/furnaces/1.xml
  def update
    params.permit!
    @power_furnace = Power::Furnace.find(params[:id])

    respond_to do |format|
      if @power_furnace.update_attributes(params[:power_furnace])
        format.html { redirect_to(@power_furnace, :notice => 'Furnace was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @power_furnace.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /power/furnaces/1
  # DELETE /power/furnaces/1.xml
  def destroy
    @power_furnace = Power::Furnace.find(params[:id])
    @power_furnace.destroy

    respond_to do |format|
      format.html { redirect_to(power_furnaces_url) }
      format.xml  { head :ok }
    end
  end
end
