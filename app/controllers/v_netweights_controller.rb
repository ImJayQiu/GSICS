class VNetweightsController < ApplicationController
  # GET /v_netweights
  # GET /v_netweights.xml
  def index
    @v_netweights = VNetweight.paginate :page => params[:page], :order => 'date DESC',:per_page =>30

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @v_netweights }
    end
  end

  # GET /v_netweights/1
  # GET /v_netweights/1.xml
  def show
    @v_netweight = VNetweight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @v_netweight }
    end
  end

  # GET /v_netweights/new
  # GET /v_netweights/new.xml
  def new
    @v_netweight = VNetweight.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @v_netweight }
    end
  end

  # GET /v_netweights/1/edit
  def edit
    @v_netweight = VNetweight.find(params[:id])
  end

  # POST /v_netweights
  # POST /v_netweights.xml
  def create
    params.permit!
    @v_netweight = VNetweight.new(params[:v_netweight])

    respond_to do |format|
      if @v_netweight.save
        format.html { redirect_to(@v_netweight, :notice => 'V netweight was successfully created.') }
        format.xml  { render :xml => @v_netweight, :status => :created, :location => @v_netweight }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @v_netweight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /v_netweights/1
  # PUT /v_netweights/1.xml
  def update
    params.permit!
    @v_netweight = VNetweight.find(params[:id])

    respond_to do |format|
      if @v_netweight.update_attributes(params[:v_netweight])
        format.html { redirect_to(@v_netweight, :notice => 'V netweight was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @v_netweight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /v_netweights/1
  # DELETE /v_netweights/1.xml
  def destroy
    @v_netweight = VNetweight.find(params[:id])
    @v_netweight.destroy

    respond_to do |format|
      format.html { redirect_to(v_netweights_url) }
      format.xml  { head :ok }
    end
  end
end
