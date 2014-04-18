class CoasiliconsController < ApplicationController
  # GET /coasilicons
  # GET /coasilicons.xml
  def index
    @coasilicons = Coasilicon.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @coasilicons }
    end
  end

  # GET /coasilicons/1
  # GET /coasilicons/1.xml
  def show
    @coasilicon = Coasilicon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @coasilicon }
    end
  end

  # GET /coasilicons/new
  # GET /coasilicons/new.xml
  def new
    @coasilicon = Coasilicon.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @coasilicon }
    end
  end

  # GET /coasilicons/1/edit
  def edit
    @coasilicon = Coasilicon.find(params[:id])
  end

  # POST /coasilicons
  # POST /coasilicons.xml
  def create
    params.permit!
    @coasilicon = Coasilicon.new(params[:coasilicon])

    respond_to do |format|
      if @coasilicon.save
        format.html { redirect_to(@coasilicon, :notice => 'Coasilicon was successfully created.') }
        format.xml  { render :xml => @coasilicon, :status => :created, :location => @coasilicon }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @coasilicon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /coasilicons/1
  # PUT /coasilicons/1.xml
  def update
    params.permit!
    @coasilicon = Coasilicon.find(params[:id])

    respond_to do |format|
      if @coasilicon.update_attributes(params[:coasilicon])
        format.html { redirect_to(@coasilicon, :notice => 'Coasilicon was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @coasilicon.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /coasilicons/1
  # DELETE /coasilicons/1.xml
  def destroy
    @coasilicon = Coasilicon.find(params[:id])
    @coasilicon.destroy

    respond_to do |format|
      format.html { redirect_to(coasilicons_url) }
      format.xml  { head :ok }
    end
  end
end
