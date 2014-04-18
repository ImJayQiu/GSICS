#coding: utf-8
class DailyreportsController < ApplicationController
  # GET /dailyreports
  # GET /dailyreports.xml
  def index
    @dailyreports = Dailyreport.paginate :page => params[:page], :order => 'date DESC',:per_page => 30

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dailyreports }
    end
  end

  # GET /dailyreports/1
  # GET /dailyreports/1.xml
  def show
    @dailyreport = Dailyreport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dailyreport }
    end
  end

  # GET /dailyreports/new
  # GET /dailyreports/new.xml
  def new
    @dailyreport = Dailyreport.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dailyreport }
    end
  end

  # GET /dailyreports/1/edit
  def edit
    @dailyreport = Dailyreport.find(params[:id])
  end

  # POST /dailyreports
  # POST /dailyreports.xml
  def create
    params.permit!
    @dailyreport = Dailyreport.new(params[:dailyreport])

    respond_to do |format|
      if @dailyreport.save
        format.html { redirect_to(@dailyreport, :notice => '工 作 日 报 表 创 建 成 功 ！ \n\n Dailyreport was successfully created.') }
        format.xml  { render :xml => @dailyreport, :status => :created, :location => @dailyreport }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dailyreport.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dailyreports/1
  # PUT /dailyreports/1.xml
  def update
    params.permit!
    @dailyreport = Dailyreport.find(params[:id])

    respond_to do |format|
      if @dailyreport.update_attributes(params[:dailyreport])
        format.html { redirect_to(@dailyreport, :notice => '工 作 日 报 表 已 更 新 ！ \n\n Dailyreport was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dailyreport.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dailyreports/1
  # DELETE /dailyreports/1.xml
  def destroy
    @dailyreport = Dailyreport.find(params[:id])
    @dailyreport.destroy

    respond_to do |format|
      format.html { redirect_to(dailyreports_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def daily_summary
    
    if params[:start_date] && params[:end_date]
      @s_date=params[:start_date].to_date
      @e_date=params[:end_date].to_date
      @date=@s_date..@e_date
    end
    
    @all_reports=Dailyreport.where(:date=>@date)
    
    @reports=@all_reports.group_by {|r|r.date}
    
  end
  
  
  
end # end of the controller
