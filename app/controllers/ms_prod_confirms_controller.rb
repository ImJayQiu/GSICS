#coding: utf-8

class MsProdConfirmsController < ApplicationController
  # GET /ms_prod_confirms
  # GET /ms_prod_confirms.xml
  def index
    @ms_prod_confirms = MsProdConfirm.paginate :page => params[:page], :order => 'created_at DESC',:per_page => 30

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ms_prod_confirms }
    end
  end

  # GET /ms_prod_confirms/1
  # GET /ms_prod_confirms/1.xml
  def show
    @ms_prod_confirm = MsProdConfirm.find(params[:id])
    @date = @ms_prod_confirm.date
    @ms = Microsilica.where("date=?", @date).order("bag").group_by {|ms| ms.silo }
    @ms_ng = MsRework.where( :created_at => @date..(@date+1.day) )

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ms_prod_confirm }
    end
  end

  # GET /ms_prod_confirms/new
  # GET /ms_prod_confirms/new.xml
  def new
    @ms_prod_confirm = MsProdConfirm.new
    @date = params[:date].to_date
    @ms_prod_confirmed = MsProdConfirm.where("date=?", @date)
    @ms = Microsilica.where("date=?", @date).order("silo,bag").group_by {|ms| ms.silo }
    @manager = current_user.username
    @ms_ng = MsRework.where( :created_at => @date..(@date+1.day) )

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ms_prod_confirm }
    end
  end

  # GET /ms_prod_confirms/1/edit
  def edit
    @ms_prod_confirm = MsProdConfirm.find(params[:id])
  end

  # POST /ms_prod_confirms
  # POST /ms_prod_confirms.xml
  def create
    params.permit!
    @ms_prod_confirm = MsProdConfirm.new(params[:ms_prod_confirm])

    respond_to do |format|
      if @ms_prod_confirm.save
        format.html { redirect_to(@ms_prod_confirm, :notice => "本日微硅粉生产已成功确认，请通知仓库工作人员进行入库确认! Microsilica production was successfully confirmed.") }
        format.xml  { render :xml => @ms_prod_confirm, :status => :created, :location => @ms_prod_confirm }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ms_prod_confirm.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ms_prod_confirms/1
  # PUT /ms_prod_confirms/1.xml
  def update
    params.permit!
    @ms_prod_confirm = MsProdConfirm.find(params[:id])

    respond_to do |format|
      if @ms_prod_confirm.update_attributes(params[:ms_prod_confirm])
        format.html { redirect_to(@ms_prod_confirm, :notice => 'Ms prod confirm was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ms_prod_confirm.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ms_prod_confirms/1
  # DELETE /ms_prod_confirms/1.xml
  def destroy
    @ms_prod_confirm = MsProdConfirm.find(params[:id])
    @ms_prod_confirm.destroy

    respond_to do |format|
      format.html { redirect_to(ms_prod_confirms_url) }
      format.xml  { head :ok }
    end
  end
end
