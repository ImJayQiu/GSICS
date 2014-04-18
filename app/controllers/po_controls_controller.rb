class PoControlsController < ApplicationController
  # GET /po_controls
  # GET /po_controls.xml
  def index
    @po_controls = PoControl.paginate :page => params[:page], :order => 'date DESC, po_no DESC',:per_page => 30

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @po_controls }
    end
  end

  # GET /po_controls/1
  # GET /po_controls/1.xml
  def show
    @po_control = PoControl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @po_control }
    end
  end

  # GET /po_controls/new
  # GET /po_controls/new.xml
  def new
    @po_control = PoControl.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @po_control }
    end
  end

  # GET /po_controls/1/edit
  def edit
    @po_control = PoControl.find(params[:id])
  end

  # POST /po_controls
  # POST /po_controls.xml
  def create
    params.permit!
    @po_control = PoControl.new(params[:po_control])

    respond_to do |format|
      if @po_control.save
        format.html { redirect_to(@po_control, :notice => 'Po control was successfully created.') }
        format.xml  { render :xml => @po_control, :status => :created, :location => @po_control }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @po_control.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /po_controls/1
  # PUT /po_controls/1.xml
  def update
    params.permit!
    @po_control = PoControl.find(params[:id])

    respond_to do |format|
      if @po_control.update_attributes(params[:po_control])
        format.html { redirect_to(@po_control, :notice => 'Po control was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @po_control.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /po_controls/1
  # DELETE /po_controls/1.xml
  def destroy
    @po_control = PoControl.find(params[:id])
    @po_control.destroy

    respond_to do |format|
      format.html { redirect_to(po_controls_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def po_search_result
    
    if params[:po]
      @po_control = PoControl.where("po_no = ?" ,params[:po]).first 
    end
  
  end
  
end
