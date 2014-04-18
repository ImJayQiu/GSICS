class FreightsController < ApplicationController
  # GET /freights
  # GET /freights.xml
  def index
    @freights = Freight.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @freights }
    end
  end

  # GET /freights/1
  # GET /freights/1.xml
  def show
    @freight = Freight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @freight }
    end
  end

  # GET /freights/new
  # GET /freights/new.xml
  def new
    @freight = Freight.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @freight }
    end
  end

  # GET /freights/1/edit
  def edit
    @freight = Freight.find(params[:id])
  end

  # POST /freights
  # POST /freights.xml
  def create
    params.permit!
    @freight = Freight.new(params[:freight])

    respond_to do |format|
      if @freight.save
        format.html { redirect_to(@freight, :notice => 'Freight was successfully created.') }
        format.xml  { render :xml => @freight, :status => :created, :location => @freight }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @freight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /freights/1
  # PUT /freights/1.xml
  def update
    params.permit!
    @freight = Freight.find(params[:id])

    respond_to do |format|
      if @freight.update_attributes(params[:freight])
        format.html { redirect_to(@freight, :notice => 'Freight was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @freight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /freights/1
  # DELETE /freights/1.xml
  def destroy
    @freight = Freight.find(params[:id])
    @freight.destroy

    respond_to do |format|
      format.html { redirect_to(freights_url) }
      format.xml  { head :ok }
    end
  end
end
