class Hr::PositionsController < ApplicationController
  # GET /hr/positions
  # GET /hr/positions.xml
  def index
    @hr_positions = Hr::Position.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hr_positions }
    end
  end

  # GET /hr/positions/1
  # GET /hr/positions/1.xml
  def show
    @hr_position = Hr::Position.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hr_position }
    end
  end

  # GET /hr/positions/new
  # GET /hr/positions/new.xml
  def new
    @hr_position = Hr::Position.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hr_position }
    end
  end

  # GET /hr/positions/1/edit
  def edit
    @hr_position = Hr::Position.find(params[:id])
  end

  # POST /hr/positions
  # POST /hr/positions.xml
  def create
    params.permit!
    @hr_position = Hr::Position.new(params[:hr_position])

    respond_to do |format|
      if @hr_position.save
        format.html { redirect_to(@hr_position, :notice => 'Position was successfully created.') }
        format.xml  { render :xml => @hr_position, :status => :created, :location => @hr_position }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hr_position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hr/positions/1
  # PUT /hr/positions/1.xml
  def update
    params.permit!
    @hr_position = Hr::Position.find(params[:id])

    respond_to do |format|
      if @hr_position.update_attributes(params[:hr_position])
        format.html { redirect_to(@hr_position, :notice => 'Position was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hr_position.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hr/positions/1
  # DELETE /hr/positions/1.xml
  def destroy
    @hr_position = Hr::Position.find(params[:id])
    @hr_position.destroy

    respond_to do |format|
      format.html { redirect_to(hr_positions_url) }
      format.xml  { head :ok }
    end
  end
end
