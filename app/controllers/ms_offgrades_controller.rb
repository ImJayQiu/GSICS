class MsOffgradesController < ApplicationController
  # GET /ms_offgrades
  # GET /ms_offgrades.xml
  def index
    @ms_offgrades = MsOffgrade.paginate :page => params[:page], :order => 'created_at DESC',:per_page => 30

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ms_offgrades }
    end
  end

  # GET /ms_offgrades/1
  # GET /ms_offgrades/1.xml
  def show
    @ms_offgrade = MsOffgrade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ms_offgrade }
    end
  end

  # GET /ms_offgrades/new
  # GET /ms_offgrades/new.xml
  def new
    @ms_offgrade = MsOffgrade.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ms_offgrade }
    end
  end

  # GET /ms_offgrades/1/edit
  def edit
    @ms_offgrade = MsOffgrade.find(params[:id])
  end

  # POST /ms_offgrades
  # POST /ms_offgrades.xml
  def create
    params.permit!
    @ms_offgrade = MsOffgrade.new(params[:ms_offgrade])

    respond_to do |format|
      if @ms_offgrade.save
        format.html { redirect_to(@ms_offgrade, :notice => 'Ms offgrade was successfully created.') }
        format.xml  { render :xml => @ms_offgrade, :status => :created, :location => @ms_offgrade }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ms_offgrade.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ms_offgrades/1
  # PUT /ms_offgrades/1.xml
  def update
    params.permit!
    @ms_offgrade = MsOffgrade.find(params[:id])

    respond_to do |format|
      if @ms_offgrade.update_attributes(params[:ms_offgrade])
        format.html { redirect_to(@ms_offgrade, :notice => 'Ms offgrade was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ms_offgrade.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ms_offgrades/1
  # DELETE /ms_offgrades/1.xml
  def destroy
    @ms_offgrade = MsOffgrade.find(params[:id])
    @ms_offgrade.destroy

    respond_to do |format|
      format.html { redirect_to(ms_offgrades_url) }
      format.xml  { head :ok }
    end
  end
end
