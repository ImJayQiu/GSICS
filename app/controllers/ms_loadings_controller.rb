class MsLoadingsController < ApplicationController
  # GET /ms_loadings
  # GET /ms_loadings.xml
  def index
    @ms_loadings = MsLoading.paginate :page => params[:page], :order => 'date DESC',:per_page => 40

    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ms_loadings }
    end
  end

  # GET /ms_loadings/1
  # GET /ms_loadings/1.xml
  def show
    @ms_loading = MsLoading.find(params[:id])
    
    @po_info = PoControl.where("po_no = ?",@ms_loading.po)[0]

    if @ms_loading.po_index.nil? or @ms_loading.po_index.blank? 
      @po_final = @ms_loading.po 
    else 
      @po_final = @ms_loading.po + ' - ' + @ms_loading.po_index
    end

    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ms_loading }
    end
  end

  # GET /ms_loadings/new
  # GET /ms_loadings/new.xml
  def new
    @ms_loading = MsLoading.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ms_loading }
    end
  end

  # GET /ms_loadings/1/edit
  def edit
    @ms_loading = MsLoading.find(params[:id])
  end

  # POST /ms_loadings
  # POST /ms_loadings.xml
  def create
    params.permit!
    @ms_loading = MsLoading.new(params[:ms_loading])

    respond_to do |format|
      if @ms_loading.save
        format.html { redirect_to(@ms_loading, :notice => 'Ms loading was successfully created.') }
        format.xml  { render :xml => @ms_loading, :status => :created, :location => @ms_loading }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ms_loading.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ms_loadings/1
  # PUT /ms_loadings/1.xml
  def update
    params.permit!
    @ms_loading = MsLoading.find(params[:id])

    respond_to do |format|
      if @ms_loading.update_attributes(params[:ms_loading])
        format.html { redirect_to(@ms_loading, :notice => 'Ms loading was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ms_loading.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ms_loadings/1
  # DELETE /ms_loadings/1.xml
  def destroy
    @ms_loading = MsLoading.find(params[:id])
    @ms_loading.destroy

    respond_to do |format|
      format.html { redirect_to(ms_loadings_url) }
      format.xml  { head :ok }
    end
  end
  
  
  
  def loading_summary_search_result
  
    if params[:start_date] && params[:end_date] 
      @start_date = params[:start_date].to_date
      @end_date = params[:end_date].to_date
      @date_period = @start_date..@end_date
    end
    
    if params[:destination].nil? #&& params[:product] && params[:grade]
      @destination="%"
    else
      @destination=params[:destination]
      #@product=params[:product]
      # @grade=params[:grade]
    end
  
    @total_shipping = MsLoading.where(:date=>@date_period, :destination=>@destination)
    
  end # end of loading_summary_search_result
  
  
  
end
