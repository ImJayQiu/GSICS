class MsshiplotsController < ApplicationController
  # GET /msshiplots
  # GET /msshiplots.xml
  def index
    @msshiplots = Msshiplot.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @msshiplots }
    end
  end

  # GET /msshiplots/1
  # GET /msshiplots/1.xml
  def show
    @msshiplot = Msshiplot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @msshiplot }
    end
  end

  # GET /msshiplots/new
  # GET /msshiplots/new.xml
  def new
    @msshiplot = Msshiplot.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @msshiplot }
    end
  end

  # GET /msshiplots/1/edit
  def edit
    @msshiplot = Msshiplot.find(params[:id])
  end

  # POST /msshiplots
  # POST /msshiplots.xml
  def create
    params.permit!
    @msshiplot = Msshiplot.new(params[:msshiplot])

    respond_to do |format|
      if @msshiplot.save
        format.html { redirect_to(@msshiplot, :notice => 'Msshiplot was successfully created.') }
        format.xml  { render :xml => @msshiplot, :status => :created, :location => @msshiplot }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @msshiplot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /msshiplots/1
  # PUT /msshiplots/1.xml
  def update
    params.permit!
    @msshiplot = Msshiplot.find(params[:id])

    respond_to do |format|
      if @msshiplot.update_attributes(params[:msshiplot])
        format.html { redirect_to(@msshiplot, :notice => 'Msshiplot was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @msshiplot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /msshiplots/1
  # DELETE /msshiplots/1.xml
  def destroy
    @msshiplot = Msshiplot.find(params[:id])
    @msshiplot.destroy

    respond_to do |format|
      format.html { redirect_to(msshiplots_url) }
      format.xml  { head :ok }
    end
  end
end
