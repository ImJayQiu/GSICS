#coding = utf-8

class WeightingsController < ApplicationController
  # GET /weightings
  # GET /weightings.xml
  def index
    @weightings = Weighting.paginate :page => params[:page], :order => 'created_at DESC',:per_page => 20

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @weightings }
    end
  end

  # GET /weightings/1
  # GET /weightings/1.xml
  def show
    @weighting = Weighting.find(params[:id])
    @v_netweight=VNetweight.where(:date=>@weighting.created_at.strftime("%Y-%m-%d"), :code=>@weighting.truck_id).first.net_weight.to_i

    @net_weight = @weighting.weight.to_i-@v_netweight rescue nil
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @weighting }
    end
  end

  # GET /weightings/new
  # GET /weightings/new.xml
  def new
    @weighting = Weighting.new
    @form_no=DateTime.now.strftime("%y%j%H%M%S")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @weighting }
    end
  end

  # GET /weightings/1/edit
  def edit
    @weighting = Weighting.find(params[:id])
    
    @form_no=@weighting.form_no
    
    
    
  end

  # POST /weightings
  # POST /weightings.xml
  def create
    params.permit!
    @weighting = Weighting.new(params[:weighting])

    respond_to do |format|
      if @weighting.save
        format.html { redirect_to(@weighting, :notice => 'Weighting was successfully created.') }
        format.xml  { render :xml => @weighting, :status => :created, :location => @weighting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @weighting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /weightings/1
  # PUT /weightings/1.xml
  def update
    params.permit!
    @weighting = Weighting.find(params[:id])

    respond_to do |format|
      if @weighting.update_attributes(params[:weighting])
        format.html { redirect_to(@weighting, :notice => 'Weighting was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @weighting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /weightings/1
  # DELETE /weightings/1.xml
  def destroy
    @weighting = Weighting.find(params[:id])
    @weighting.destroy

    respond_to do |format|
      format.html { redirect_to(weightings_url) }
      format.xml  { head :ok }
    end
  end # end of destroy
  
  def summary
    
    if params[:start_date] && params[:end_date]   
      
      @start_date = params[:start_date].to_date
      @end_date = params[:end_date].to_date
      
      @date_period = @start_date..@end_date  
    end
    
    @p_summary=Weighting.where("DATE(created_at)>=? AND DATE(created_at)<= ?", @start_date, @end_date)
    @p_count=@p_summary.count.to_s
    @v_group=@p_summary.group_by{|p|p.truck_id}
    @day_group=@p_summary.group_by{|p|p.created_at.strftime("%Y-%m-%d")}
    
  end # end of summary
  
  
  
  
end
