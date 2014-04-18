class ItRepairsController < ApplicationController
  # GET /it_repairs
  # GET /it_repairs.xml
  skip_authorization_check
  skip_authorize_resource
  
  def index
    @it_repairs = ItRepair.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 50

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @it_repairs }
    end
    
  end
  

  # GET /it_repairs/1
  # GET /it_repairs/1.xml
  def show
    @it_repair = ItRepair.find(params[:id])

    @c_ip = ItDevice.where(:code=>@it_repair.c_name).first.ip rescue nil
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @it_repair }
    end
  end

  # GET /it_repairs/new
  # GET /it_repairs/new.xml
  def new
    @it_repair = ItRepair.new
    @code = "ICT01-#{DateTime.now.strftime('%y%m%d%H%M%S')}"
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @it_repair }
    end
  end

  # GET /it_repairs/1/edit
  def edit
    @it_repair = ItRepair.find(params[:id])
    
    if @it_repair.code.blank?
      @code = "ICT01-#{DateTime.now.strftime('%y%m%d%H%M%S')}"
    else
      @code = @it_repair.code
    end
    
  end

  # POST /it_repairs
  # POST /it_repairs.xml
  def create
    params.permit!
    @it_repair = ItRepair.new(params[:it_repair])

    respond_to do |format|
      if @it_repair.save
        format.html { redirect_to(@it_repair, :notice => 'IT Service Request was successfully created.') }
        format.xml  { render :xml => @it_repair, :status => :created, :location => @it_repair }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @it_repair.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /it_repairs/1
  # PUT /it_repairs/1.xml
  def update
    params.permit!
    @it_repair = ItRepair.find(params[:id])

    respond_to do |format|
      if @it_repair.update_attributes(params[:it_repair])
        format.html { redirect_to(@it_repair, :notice => 'IT Service Request was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @it_repair.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /it_repairs/1
  # DELETE /it_repairs/1.xml
  def destroy
    @it_repair = ItRepair.find(params[:id])
    @it_repair.destroy

    respond_to do |format|
      format.html { redirect_to(it_repairs_url) }
      format.xml  { head :ok }
    end
  end
  
  
  
  
  
  
  
end
