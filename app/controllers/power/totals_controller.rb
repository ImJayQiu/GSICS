class Power::TotalsController < ApplicationController
  # GET /power/totals
  # GET /power/totals.xml
  def index
    @power_totals = Power::Total.paginate :page => params[:page], :order => 'date DESC, time DESC', :per_page => 30

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @power_totals }
    end
  end

  # GET /power/totals/1
  # GET /power/totals/1.xml
  def show
    @power_total = Power::Total.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @power_total }
    end
  end

  # GET /power/totals/new
  # GET /power/totals/new.xml
  def new
    @power_total = Power::Total.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @power_total }
    end
  end

  # GET /power/totals/1/edit
  def edit
    @power_total = Power::Total.find(params[:id])
  end

  # POST /power/totals
  # POST /power/totals.xml
  def create
    params.permit!
    @power_total = Power::Total.new(params[:power_total])

    respond_to do |format|
      if @power_total.save
        format.html { redirect_to(@power_total, :notice => 'Total was successfully created.') }
        format.xml  { render :xml => @power_total, :status => :created, :location => @power_total }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @power_total.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /power/totals/1
  # PUT /power/totals/1.xml
  def update
    params.permit!
    @power_total = Power::Total.find(params[:id])

    respond_to do |format|
      if @power_total.update_attributes(params[:power_total])
        format.html { redirect_to(@power_total, :notice => 'Total was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @power_total.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /power/totals/1
  # DELETE /power/totals/1.xml
  def destroy
    @power_total = Power::Total.find(params[:id])
    @power_total.destroy

    respond_to do |format|
      format.html { redirect_to(power_totals_url) }
      format.xml  { head :ok }
    end
  end
  
  def summary
    if params[:sdate] && params[:edate]   
      
      @start_date = params[:sdate].to_date
      @end_date = params[:edate].to_date+1
      @furnace = params[:furnace]
      
      @date_period = @start_date..@end_date
      
    end
    
    if @furnace.blank?
      @total_power = Power::Total.includes(:furnaces).order(:date,:time).where(:date=>@date_period)
      #@total_power= Power::Furnace.joins(:total).where('power_totals.date >= ? and power_totals.date <= ?', @start_date, @end_date )
    else
      @total_power = Power::Total.includes(:furnaces).where(:date=>@date_period, :power_furnaces=>{:furnace=>@furnace})
      #@total_power = Power::Furnace.joins(:total).where('power_totals.date >= ? and power_totals.date <= ? and furnace=?', @start_date, @end_date, @furnace )
    end
      
    @factors=Power::Factor.first
    @f_m1=@factors.m1
    @f_m2=@factors.m2
    @f_env=@factors.env
    @f_others=@factors.others
    @f_furnace=@factors.furnace
    
    @furnaces_all_power=[]
    @total_power.each do |tp|
      tp.furnaces.each do |fp|
        @furnaces_all_power<<fp
      end
    end
    @f_power=@furnaces_all_power.group_by { |f|f.furnace  }.sort

  end
  
end # end of class
