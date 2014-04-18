class VehicleRequestsController < ApplicationController
  # GET /vehicle_requests
  # GET /vehicle_requests.xml
  def index
    @vehicle_requests = VehicleRequest.paginate :page => params[:page], :order => 'created_at DESC',:per_page =>30

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vehicle_requests }
    end
  end

  # GET /vehicle_requests/1
  # GET /vehicle_requests/1.xml
  def show
    @vehicle_request = VehicleRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vehicle_request }
    end
  end

  # GET /vehicle_requests/new
  # GET /vehicle_requests/new.xml
  def new
    @vehicle_request = VehicleRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vehicle_request }
    end
  end # end of new

  # GET /vehicle_requests/1/edit
  def edit
    @vehicle_request = VehicleRequest.find(params[:id])
  end 

  # POST /vehicle_requests
  # POST /vehicle_requests.xml
  def create
    params.permit!
    @vehicle_request = VehicleRequest.new(params[:vehicle_request])

    respond_to do |format|
      if @vehicle_request.save
        format.html { redirect_to(@vehicle_request, :notice => 'Vehicle request was successfully created.') }
        format.xml  { render :xml => @vehicle_request, :status => :created, :location => @vehicle_request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vehicle_request.errors, :status => :unprocessable_entity }
      end
    end
  end  # end of create

  # PUT /vehicle_requests/1
  # PUT /vehicle_requests/1.xml
  def update
    params.permit!
    @vehicle_request = VehicleRequest.find(params[:id])

    respond_to do |format|
      if @vehicle_request.update_attributes(params[:vehicle_request])
        format.html { redirect_to(@vehicle_request, :notice => 'Vehicle request was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vehicle_request.errors, :status => :unprocessable_entity }
      end
    end
  end # end of update

  # DELETE /vehicle_requests/1
  # DELETE /vehicle_requests/1.xml
  def destroy
    @vehicle_request = VehicleRequest.find(params[:id])
    @vehicle_request.destroy

    respond_to do |format|
      format.html { redirect_to(vehicle_requests_url) }
      format.xml  { head :ok }
    end
  end #end of destory
  
  
  
  
  def planning
    
    utf8_arr = [0xEF,0xBB,0xBF] 
    utf8_str = utf8_arr.pack("c3")
    
    if params[:date]
      @date=params[:date].to_date
    end
    
    @requests=VehicleRequest.where("DATE(s_time)=?",@date)
    
  end
  
  
  
  
  
end
