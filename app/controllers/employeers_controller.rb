class EmployeersController < ApplicationController
  # GET /employeers
  # GET /employeers.xml
  def index
    @employeers = Employeer.paginate :page => params[:page], :order => 'employee_no',:per_page => 50

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @employeers }
    end
  end

  # GET /employeers/1
  # GET /employeers/1.xml
  def show
    @employeer = Employeer.find(params[:id])
    
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employeer }
    end
  end

  # GET /employeers/new
  # GET /employeers/new.xml
  def new
    @employeer = Employeer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employeer }
    end
  end

  # GET /employeers/1/edit
  def edit
    @employeer = Employeer.find(params[:id])
  end

  # POST /employeers
  # POST /employeers.xml
  def create
    params.permit!
    @employeer = Employeer.new(params[:employeer])

    respond_to do |format|
      if @employeer.save
        format.html { redirect_to(@employeer, :notice => 'Employeer was successfully created.') }
        format.xml  { render :xml => @employeer, :status => :created, :location => @employeer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employeer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /employeers/1
  # PUT /employeers/1.xml
  def update
    params.permit!
    @employeer = Employeer.find(params[:id])

    respond_to do |format|
      if @employeer.update_attributes(params[:employeer])
        format.html { redirect_to(@employeer, :notice => 'Employeer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employeer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /employeers/1
  # DELETE /employeers/1.xml
  def destroy
    @employeer = Employeer.find(params[:id])
    @employeer.destroy

    respond_to do |format|
      format.html { redirect_to(employeers_url) }
      format.xml  { head :ok }
    end
  end
end
