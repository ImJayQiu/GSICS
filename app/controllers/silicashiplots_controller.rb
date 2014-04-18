class SilicashiplotsController < ApplicationController
  # GET /silicashiplots
  # GET /silicashiplots.xml
  def index
    @silicashiplots = Silicashiplot.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @silicashiplots }
    end
  end

  # GET /silicashiplots/1
  # GET /silicashiplots/1.xml
  def show
    @silicashiplot = Silicashiplot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @silicashiplot }
    end
  end

  # GET /silicashiplots/new
  # GET /silicashiplots/new.xml
  def new
    @silicashiplot = Silicashiplot.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @silicashiplot }
    end
  end

  # GET /silicashiplots/1/edit
  def edit
    @silicashiplot = Silicashiplot.find(params[:id])
  end

  # POST /silicashiplots
  # POST /silicashiplots.xml
  def create
    params.permit!
    @silicashiplot = Silicashiplot.new(params[:silicashiplot])

    respond_to do |format|
      if @silicashiplot.save
        format.html { redirect_to(@silicashiplot, :notice => 'Silicashiplot was successfully created.') }
        format.xml  { render :xml => @silicashiplot, :status => :created, :location => @silicashiplot }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @silicashiplot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /silicashiplots/1
  # PUT /silicashiplots/1.xml
  def update
    params.permit!
    @silicashiplot = Silicashiplot.find(params[:id])

    respond_to do |format|
      if @silicashiplot.update_attributes(params[:silicashiplot])
        format.html { redirect_to(@silicashiplot, :notice => 'Silicashiplot was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @silicashiplot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /silicashiplots/1
  # DELETE /silicashiplots/1.xml
  def destroy
    @silicashiplot = Silicashiplot.find(params[:id])
    @silicashiplot.destroy

    respond_to do |format|
      format.html { redirect_to(silicashiplots_url) }
      format.xml  { head :ok }
    end
  end
end
