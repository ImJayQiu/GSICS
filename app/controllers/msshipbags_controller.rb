class MsshipbagsController < ApplicationController
  # GET /msshipbags
  # GET /msshipbags.xml
  def index
    @msshipbags = Msshipbag.all 

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @msshipbags }
    end
  end

  # GET /msshipbags/1
  # GET /msshipbags/1.xml
  def show
    @msshipbag = Msshipbag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @msshipbag }
    end
  end

  # GET /msshipbags/new
  # GET /msshipbags/new.xml
  def new
    @msshipbag = Msshipbag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @msshipbag }
    end
  end

  # GET /msshipbags/1/edit
  def edit
    @msshipbag = Msshipbag.find(params[:id])
  end

  # POST /msshipbags
  # POST /msshipbags.xml
  def create
    params.permit!
    @msshipbag = Msshipbag.new(params[:msshipbag])

    respond_to do |format|
      if @msshipbag.save
        format.html { redirect_to(@msshipbag, :notice => 'Msshipbag was successfully created.') }
        format.xml  { render :xml => @msshipbag, :status => :created, :location => @msshipbag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @msshipbag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /msshipbags/1
  # PUT /msshipbags/1.xml
  def update
    params.permit!
    @msshipbag = Msshipbag.find(params[:id])

    respond_to do |format|
      if @msshipbag.update_attributes(params[:msshipbag])
        format.html { redirect_to(@msshipbag, :notice => 'Msshipbag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @msshipbag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /msshipbags/1
  # DELETE /msshipbags/1.xml
  def destroy
    @msshipbag = Msshipbag.find(params[:id])
    @msshipbag.destroy

    respond_to do |format|
      format.html { redirect_to(msshipbags_url) }
      format.xml  { head :ok }
    end
  end
end
