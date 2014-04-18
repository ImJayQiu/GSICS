class MssamplesController < ApplicationController
  # GET /mssamples
  # GET /mssamples.xml
  def index
    @mssamples = Mssample.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mssamples }
    end
  end

  # GET /mssamples/1
  # GET /mssamples/1.xml
  def show
    @mssample = Mssample.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mssample }
    end
  end

  # GET /mssamples/new
  # GET /mssamples/new.xml
  def new
    @mssample = Mssample.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mssample }
    end
  end

  # GET /mssamples/1/edit
  def edit
    @mssample = Mssample.find(params[:id])
  end

  # POST /mssamples
  # POST /mssamples.xml
  def create
    params.permit!
    @mssample = Mssample.new(params[:mssample])

    respond_to do |format|
      if @mssample.save
        format.html { redirect_to(@mssample, :notice => 'Mssample was successfully created.') }
        format.xml  { render :xml => @mssample, :status => :created, :location => @mssample }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mssample.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mssamples/1
  # PUT /mssamples/1.xml
  def update
    params.permit!
    @mssample = Mssample.find(params[:id])

    respond_to do |format|
      if @mssample.update_attributes(params[:mssample])
        format.html { redirect_to(@mssample, :notice => 'Mssample was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mssample.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mssamples/1
  # DELETE /mssamples/1.xml
  def destroy
    @mssample = Mssample.find(params[:id])
    @mssample.destroy

    respond_to do |format|
      format.html { redirect_to(mssamples_url) }
      format.xml  { head :ok }
    end
  end
end
