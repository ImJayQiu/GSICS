class PickingsController < ApplicationController
  # GET /pickings
  # GET /pickings.xml
  def index
    @pickings = Picking.paginate :page => params[:page], :order => 'created_at DESC',:per_page => 50

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pickings }
    end
  end

  # GET /pickings/1
  # GET /pickings/1.xml
  def show
    @picking = Picking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @picking }
    end
  end

  # GET /pickings/new
  # GET /pickings/new.xml
  def new
    @picking = Picking.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @picking }
    end
  end

  # GET /pickings/1/edit
  def edit
    @picking = Picking.find(params[:id])
  end

  # POST /pickings
  # POST /pickings.xml
  def create
    params.permit!
    @picking = Picking.new(params[:picking])

    respond_to do |format|
      if @picking.save
        format.html { redirect_to(@picking, :notice => 'Picking was successfully created.') }
        format.xml  { render :xml => @picking, :status => :created, :location => @picking }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @picking.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pickings/1
  # PUT /pickings/1.xml
  def update
    params.permit!
    @picking = Picking.find(params[:id])

    respond_to do |format|
      if @picking.update_attributes(params[:picking])
        format.html { redirect_to(@picking, :notice => 'Picking was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @picking.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pickings/1
  # DELETE /pickings/1.xml
  def destroy
    @picking = Picking.find(params[:id])
    @picking.destroy

    respond_to do |format|
      format.html { redirect_to(pickings_url) }
      format.xml  { head :ok }
    end
  end
end
