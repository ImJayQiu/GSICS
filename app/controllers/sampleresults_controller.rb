class SampleresultsController < ApplicationController
  # GET /sampleresults
  # GET /sampleresults.xml
  def index
    @sampleresults = Sampleresult.paginate :page => params[:page], :order => 'date DESC, week DESC, silo', :per_page=> 10

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sampleresults }
    end
  end

  # GET /sampleresults/1
  # GET /sampleresults/1.xml
  def show
    @sampleresult = Sampleresult.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sampleresult }
    end
  end

  # GET /sampleresults/new
  # GET /sampleresults/new.xml
  def new
    @sampleresult = Sampleresult.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sampleresult }
    end
  end

  # GET /sampleresults/1/edit
  def edit
    @sampleresult = Sampleresult.find(params[:id])
  end

  # POST /sampleresults
  # POST /sampleresults.xml
  def create
    params.permit!
    @sampleresult = Sampleresult.new(params[:sampleresult])

    respond_to do |format|
      if @sampleresult.save
        format.html { redirect_to(@sampleresult, :notice => 'Sampleresult was successfully created.') }
        format.xml  { render :xml => @sampleresult, :status => :created, :location => @sampleresult }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sampleresult.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sampleresults/1
  # PUT /sampleresults/1.xml
  def update
    params.permit!
    @sampleresult = Sampleresult.find(params[:id])

    respond_to do |format|
      if @sampleresult.update_attributes(params[:sampleresult])
        format.html { redirect_to(@sampleresult, :notice => 'Sampleresult was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sampleresult.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sampleresults/1
  # DELETE /sampleresults/1.xml
  def destroy
    @sampleresult = Sampleresult.find(params[:id])
    @sampleresult.destroy

    respond_to do |format|
      format.html { redirect_to(sampleresults_url) }
      format.xml  { head :ok }
    end
  end
end
