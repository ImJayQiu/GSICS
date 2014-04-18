class Hr::AttendencesController < ApplicationController
  # GET /hr/attendences
  # GET /hr/attendences.xml
  def index
    
    @att_all = Hr::Attendence.select("Time_of_swipe_card").all :order => 'Time_of_swipe_card DESC', :limit=>20000
    @att_group = @att_all.group_by {|a|a.Time_of_swipe_card.strftime("%Y-%m-%d")}
    @att_pages = @att_group.keys.paginate :page => params[:page], :order => 'Time_of_swipe_card DESC', :per_page => 30
    
    
    #        @hr_attendences = @att_group[:t].paginate :page => params[:page], 
    #          :order => 'created_at DESC', 
    #          :per_page => 50

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @att_group }
    end
  end

  # GET /hr/attendences/1
  # GET /hr/attendences/1.xml
  def show
    @hr_attendence = Hr::Attendence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hr_attendence }
    end
  end

  # GET /hr/attendences/new
  # GET /hr/attendences/new.xml
  def new
    @hr_attendence = Hr::Attendence.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hr_attendence }
    end
  end

  # GET /hr/attendences/1/edit
  def edit
    @hr_attendence = Hr::Attendence.find(params[:id])
  end

  # POST /hr/attendences
  # POST /hr/attendences.xml
  def create
    params.permit!
    @hr_attendence = Hr::Attendence.new(params[:hr_attendence])

    respond_to do |format|
      if @hr_attendence.save
        format.html { redirect_to(@hr_attendence, :notice => 'Attendence was successfully created.') }
        format.xml  { render :xml => @hr_attendence, :status => :created, :location => @hr_attendence }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hr_attendence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hr/attendences/1
  # PUT /hr/attendences/1.xml
  def update
    params.permit!
    @hr_attendence = Hr::Attendence.find(params[:id])

    respond_to do |format|
      if @hr_attendence.update_attributes(params[:hr_attendence])
        format.html { redirect_to(@hr_attendence, :notice => 'Attendence was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hr_attendence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hr/attendences/1
  # DELETE /hr/attendences/1.xml
  def destroy
    @hr_attendence = Hr::Attendence.find(params[:id])
    @hr_attendence.destroy

    respond_to do |format|
      format.html { redirect_to(hr_attendences_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def import
   
    Hr::Attendence.import(params[:file])
    redirect_to hr_attendences_path, notice: "Attendences Imported."
  end
  
  def summary
    if params[:sdate] && params[:edate]   
      
      @start_date = params[:sdate].to_date
      @end_date = params[:edate].to_date
      
      
      @date_period = @start_date..@end_date
      
    end
    
    # all attendence records in date range
    @att_select = Hr::Attendence.where("DATE(Time_of_swipe_card) >= ? AND DATE(Time_of_swipe_card) <= ? ", @start_date, @end_date).order("Name")
    
    #group attendences by date
    @att_group = @att_select.group_by {|a|a.Time_of_swipe_card.strftime("%Y-%m-%d")}
    
    #group attendences by name
    @att_name_group = @att_select.group_by {|a|a.Name}
     
   
    
  end
  
end
