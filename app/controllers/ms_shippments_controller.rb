class MsShippmentsController < ApplicationController
  # GET /ms_shippments
  # GET /ms_shippments.xml
  def index
    @ms_shippments = MsShippment.paginate :page => params[:page], :order => 'date DESC, po, gpo', :per_page => 30

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ms_shippments }
    end
  end

  # GET /ms_shippments/1
  # GET /ms_shippments/1.xml
  def show
    @ms_shippment = MsShippment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ms_shippment }
    end
  end

  # GET /ms_shippments/new
  # GET /ms_shippments/new.xml
  def new
    @ms_shippment = MsShippment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ms_shippment }
    end
  end

  # GET /ms_shippments/1/edit
  def edit
    @ms_shippment = MsShippment.find(params[:id])
  end

  # POST /ms_shippments
  # POST /ms_shippments.xml
  def create
    params.permit!
    @ms_shippment = MsShippment.new(params[:ms_shippment])

    respond_to do |format|
      if @ms_shippment.save
        format.html { redirect_to(@ms_shippment, :notice => 'Ms shippment was successfully created.') }
        format.xml  { render :xml => @ms_shippment, :status => :created, :location => @ms_shippment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ms_shippment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ms_shippments/1
  # PUT /ms_shippments/1.xml
  def update
    params.permit!
    @ms_shippment = MsShippment.find(params[:id])

    respond_to do |format|
      if @ms_shippment.update_attributes(params[:ms_shippment])
        format.html { redirect_to(@ms_shippment, :notice => 'Ms shippment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ms_shippment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ms_shippments/1
  # DELETE /ms_shippments/1.xml
  def destroy
    @ms_shippment = MsShippment.find(params[:id])
    @ms_shippment.destroy

    respond_to do |format|
      format.html { redirect_to(ms_shippments_url) }
      format.xml  { head :ok }
    end
  end
end
