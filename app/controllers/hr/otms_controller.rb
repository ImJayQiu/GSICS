class Hr::OtmsController < ApplicationController
  # GET /hr/otms
  # GET /hr/otms.xml
  def index
    @hr_otms = Hr::Otm.paginate :page => params[:page], 
      :order => 'created_at DESC', 
      :per_page => 50

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hr_otms }
    end
  end

  # GET /hr/otms/1
  # GET /hr/otms/1.xml
  def show
    @hr_otm = Hr::Otm.find(params[:id])
    
    @employeer = Employeer.where("code=?", @hr_otm.e_id ).first
    @stime=@hr_otm.stime.strftime("%H:%M") 
    @etime=@hr_otm.etime.strftime("%H:%M") 
    @ot_time=((@hr_otm.etime-@hr_otm.stime)/3600).round(2)
    if @ot_time<0
      @duration=24+@ot_time
    else
      @duration=@ot_time
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hr_otm }
    end
  end

  # GET /hr/otms/new
  # GET /hr/otms/new.xml
  def new
    @hr_otm = Hr::Otm.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hr_otm }
    end
  end

  # GET /hr/otms/1/edit
  def edit
    @hr_otm = Hr::Otm.find(params[:id])
  end

  # POST /hr/otms
  # POST /hr/otms.xml
  def create
    params.permit!
    @hr_otm = Hr::Otm.new(params[:hr_otm])

    respond_to do |format|
      if @hr_otm.save
        format.html { redirect_to(@hr_otm, :notice => 'Otm was successfully created.') }
        format.xml  { render :xml => @hr_otm, :status => :created, :location => @hr_otm }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hr_otm.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hr/otms/1
  # PUT /hr/otms/1.xml
  def update
    params.permit!
    @hr_otm = Hr::Otm.find(params[:id])

    respond_to do |format|
      if @hr_otm.update_attributes(params[:hr_otm])
        format.html { redirect_to(@hr_otm, :notice => 'Otm was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hr_otm.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hr/otms/1
  # DELETE /hr/otms/1.xml
  def destroy
    @hr_otm = Hr::Otm.find(params[:id])
    @hr_otm.destroy

    respond_to do |format|
      format.html { redirect_to(hr_otms_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def summary
    
    if params[:sdate] && params[:edate]   
      
      @start_date = params[:sdate].to_date
      @end_date = params[:edate].to_date
      
      @date_period = @start_date..@end_date
      
    end
  
    if params[:dept]==""
      @total_ot = Hr::Otm.where(:date=>@date_period)
    else
      @total_ot = Hr::Otm.where(:date=>@date_period, :dept=>params[:dept])
    end
  
  
  end

end # end of class