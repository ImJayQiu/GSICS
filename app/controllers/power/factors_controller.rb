class Power::FactorsController < ApplicationController
  # GET /power/factors
  # GET /power/factors.xml
  def index
    @power_factors = Power::Factor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @power_factors }
    end
  end

  # GET /power/factors/1
  # GET /power/factors/1.xml
  def show
    @power_factor = Power::Factor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @power_factor }
    end
  end

  # GET /power/factors/new
  # GET /power/factors/new.xml
  def new
    @power_factor = Power::Factor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @power_factor }
    end
  end

  # GET /power/factors/1/edit
  def edit
    @power_factor = Power::Factor.find(params[:id])
  end

  # POST /power/factors
  # POST /power/factors.xml
  def create
    params.permit!
    @power_factor = Power::Factor.new(params[:power_factor])

    respond_to do |format|
      if @power_factor.save
        format.html { redirect_to(@power_factor, :notice => 'Factor was successfully created.') }
        format.xml  { render :xml => @power_factor, :status => :created, :location => @power_factor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @power_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /power/factors/1
  # PUT /power/factors/1.xml
  def update
    params.permit!
    @power_factor = Power::Factor.find(params[:id])

    respond_to do |format|
      if @power_factor.update_attributes(params[:power_factor])
        format.html { redirect_to(@power_factor, :notice => 'Factor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @power_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /power/factors/1
  # DELETE /power/factors/1.xml
  def destroy
    @power_factor = Power::Factor.find(params[:id])
    @power_factor.destroy

    respond_to do |format|
      format.html { redirect_to(power_factors_url) }
      format.xml  { head :ok }
    end
  end
end
