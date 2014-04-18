class SiliconsController < ApplicationController
  # GET /silicons
  # GET /silicons.xml
  
  layout "main"
  
  
  
  def index
    #    @topic = "Silicons' Quality Analysis"
    
    #    @silicons = Silicon.all :order => "date DESC"

    @silicons = Silicon.paginate :page => params[:page], :order => 'date DESC, furnace, shift, no', :per_page => 50
    @pic = Pic.select(:silicon_id)
    @silicons_group = @silicons.group_by {|s| s.furnace}
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @silicons }
    end
  end

  # GET /silicons/1
  # GET /silicons/1.xml
  
  def show
    
    @silicon = Silicon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @silicon }
    end
    
  end

  # GET /silicons/new
  # GET /silicons/new.xml
  def new

    @silicon = Silicon.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @silicon }
    end
  end

  # GET /silicons/1/edit
  def edit
 
    @silicon = Silicon.find(params[:id])
    
  end

  # POST /silicons
  # POST /silicons.xml
  
  def create
    params.permit!
    @silicon = Silicon.new(params[:silicon])

    respond_to do |format|
      if @silicon.save
        format.html { redirect_to(@silicon, :notice => 'Silicon was successfully created.') }
        format.xml  { render :xml => @silicon, :status => :created, :location => @silicon }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @silicon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /silicons/1
  # PUT /silicons/1.xml
  def update
    params.permit!
    @silicon = Silicon.find(params[:id])

    respond_to do |format|
      if @silicon.update_attributes(params[:silicon])
        format.html { redirect_to(@silicon, :notice => 'Silicon was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @silicon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /silicons/1
  # DELETE /silicons/1.xml
  def destroy
    @silicon = Silicon.find(params[:id])
    @silicon.destroy

    respond_to do |format|
      format.html { redirect_to(silicons_url) }
      format.xml  { head :ok }
    end
  end
  
  
end
