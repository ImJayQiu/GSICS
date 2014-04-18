class RmRatesController < ApplicationController
  # GET /rm_rates
  # GET /rm_rates.xml
  def index
    @rm_rates = RmRate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rm_rates }
    end
  end

  # GET /rm_rates/1
  # GET /rm_rates/1.xml
  def show
    @rm_rate = RmRate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rm_rate }
    end
  end

  # GET /rm_rates/new
  # GET /rm_rates/new.xml
  def new
    @rm_rate = RmRate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rm_rate }
    end
  end

  # GET /rm_rates/1/edit
  def edit
    @rm_rate = RmRate.find(params[:id])
  end

  # POST /rm_rates
  # POST /rm_rates.xml
  def create
    params.permit!
    @rm_rate = RmRate.new(params[:rm_rate])

    respond_to do |format|
      if @rm_rate.save
        format.html { redirect_to(@rm_rate, :notice => 'Rm rate was successfully created.') }
        format.xml  { render :xml => @rm_rate, :status => :created, :location => @rm_rate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rm_rate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rm_rates/1
  # PUT /rm_rates/1.xml
  def update
    params.permit!
    @rm_rate = RmRate.find(params[:id])

    respond_to do |format|
      if @rm_rate.update_attributes(params[:rm_rate])
        format.html { redirect_to(@rm_rate, :notice => 'Rm rate was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rm_rate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rm_rates/1
  # DELETE /rm_rates/1.xml
  def destroy
    @rm_rate = RmRate.find(params[:id])
    @rm_rate.destroy

    respond_to do |format|
      format.html { redirect_to(rm_rates_url) }
      format.xml  { head :ok }
    end
  end
end
