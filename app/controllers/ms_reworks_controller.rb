class MsReworksController < ApplicationController
  # GET /ms_reworks
  # GET /ms_reworks.xml
  def index
    @ms_reworks = MsRework.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 30

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ms_reworks }
    end
  end

  # GET /ms_reworks/1
  # GET /ms_reworks/1.xml
  def show
    @ms_rework = MsRework.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ms_rework }
    end
  end

  # GET /ms_reworks/new
  # GET /ms_reworks/new.xml
  def new
    @ms_rework = MsRework.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ms_rework }
    end
  end

  # GET /ms_reworks/1/edit
  def edit
    @ms_rework = MsRework.find(params[:id])
  end

  # POST /ms_reworks
  # POST /ms_reworks.xml
  def create
    params.permit!
    @ms_rework = MsRework.new(params[:ms_rework])

    respond_to do |format|
      if @ms_rework.save
        format.html { redirect_to(@ms_rework, :notice => 'Ms rework was successfully created.') }
        format.xml  { render :xml => @ms_rework, :status => :created, :location => @ms_rework }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ms_rework.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ms_reworks/1
  # PUT /ms_reworks/1.xml
  def update
    params.permit!
    @ms_rework = MsRework.find(params[:id])

    respond_to do |format|
      if @ms_rework.update_attributes(params[:ms_rework])
        format.html { redirect_to(@ms_rework, :notice => 'Ms rework was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ms_rework.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ms_reworks/1
  # DELETE /ms_reworks/1.xml
  def destroy
    @ms_rework = MsRework.find(params[:id])
    @ms_rework.destroy

    respond_to do |format|
      format.html { redirect_to(ms_reworks_url) }
      format.xml  { head :ok }
    end
  end
end
