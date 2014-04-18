class ComplainsController < ApplicationController
  # GET /complains
  # GET /complains.xml
  def index
    @complains = Complain.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 50

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @complains }
    end
  end

  # GET /complains/1
  # GET /complains/1.xml
  def show
    @complain = Complain.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @complain }
    end
  end

  # GET /complains/new
  # GET /complains/new.xml
  def new
    @complain = Complain.new
    @code = "GS-02-002-#{DateTime.now.strftime('%y%m%d%H%M%S')}"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @complain }
    end
  end

  # GET /complains/1/edit
  def edit
    @complain = Complain.find(params[:id])
    @code = @complain.code
  end

  # POST /complains
  # POST /complains.xml
  def create
    params.permit!
    @complain = Complain.new(params[:complain])

    respond_to do |format|
      if @complain.save
        format.html { redirect_to(@complain, :notice => 'Customer Complain was successfully created.') }
        format.xml  { render :xml => @complain, :status => :created, :location => @complain }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @complain.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /complains/1
  # PUT /complains/1.xml
  def update
    params.permit!
    @complain = Complain.find(params[:id])

    respond_to do |format|
      if @complain.update_attributes(params[:complain])
        format.html { redirect_to(@complain, :notice => 'Customer Complain was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @complain.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /complains/1
  # DELETE /complains/1.xml
  def destroy
    @complain = Complain.find(params[:id])
    @complain.destroy

    respond_to do |format|
      format.html { redirect_to(complains_url) }
      format.xml  { head :ok }
    end
  end
end
