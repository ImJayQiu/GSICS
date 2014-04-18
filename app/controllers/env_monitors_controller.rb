class EnvMonitorsController < ApplicationController
  # GET /env_monitors
  # GET /env_monitors.xml
  def index
    @env_monitors = EnvMonitor.paginate :page => params[:page],  :order => 'created_at DESC, furnace', :per_page => 144
    @env_monitors_furnace = @env_monitors.group_by { |f|f.furnace }
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @env_monitors }
    end
  end

  # GET /env_monitors/1
  # GET /env_monitors/1.xml
  def show
    @env_monitor = EnvMonitor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @env_monitor }
    end
  end

  # GET /env_monitors/new
  # GET /env_monitors/new.xml
  def new
    @env_monitor = EnvMonitor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @env_monitor }
    end
  end

  # GET /env_monitors/1/edit
  def edit
    @env_monitor = EnvMonitor.find(params[:id])
  end

  # POST /env_monitors
  # POST /env_monitors.xml
  def create
    params.permit!
    @env_monitor = EnvMonitor.new(params[:env_monitor])

    respond_to do |format|
      if @env_monitor.save
        format.html { redirect_to(@env_monitor, :notice => 'Env monitor was successfully created.') }
        format.xml  { render :xml => @env_monitor, :status => :created, :location => @env_monitor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @env_monitor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /env_monitors/1
  # PUT /env_monitors/1.xml
  def update
    params.permit!
    @env_monitor = EnvMonitor.find(params[:id])

    respond_to do |format|
      if @env_monitor.update_attributes(params[:env_monitor])
        format.html { redirect_to(@env_monitor, :notice => 'Env monitor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @env_monitor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /env_monitors/1
  # DELETE /env_monitors/1.xml
  def destroy
    @env_monitor = EnvMonitor.find(params[:id])
    @env_monitor.destroy

    respond_to do |format|
      format.html { redirect_to(env_monitors_url) }
      format.xml  { head :ok }
    end
  end
end
