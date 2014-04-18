class SilosController < ApplicationController
  # GET /silos
  # GET /silos.xml
  def index
    
    @silo = Silo.new
    @silos = Silo.paginate :page => params[:page], :order => 'created_at DESC, silo', :per_page => 96
    @silo_group = @silos.group_by{|s|s.silo}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @silos }
    end
    
    #    response.content_type = Mime::XML
    #    response.charset = "utf-8"
    
  end

  # GET /silos/1
  # GET /silos/1.xml
  def show
    @silo = Silo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @silo }
    end
  end

  # GET /silos/new
  # GET /silos/new.xml
  def new
    @silo = Silo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @silo }
    end
  end

  # GET /silos/1/edit
  def edit
    @silo = Silo.find(params[:id])
  end

  # POST /silos
  # POST /silos.xml
  def create
    params.permit!
    @silo = Silo.new(params[:silo])

    respond_to do |format|
      if @silo.save
        format.html { redirect_to(@silo, :notice => 'Silo was successfully created.') }
        format.xml  { render :xml => @silo, :status => :created, :location => @silo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @silo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /silos/1
  # PUT /silos/1.xml
  def update
    params.permit!
    @silo = Silo.find(params[:id])

    respond_to do |format|
      if @silo.update_attributes(params[:silo])
        format.html { redirect_to(@silo, :notice => 'Silo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @silo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /silos/1
  # DELETE /silos/1.xml
  def destroy
    @silo = Silo.find(params[:id])
    @silo.destroy

    respond_to do |format|
      format.html { redirect_to(silos_url) }
      format.xml  { head :ok }
    end
  end
end
