class OxygensController < ApplicationController
  # GET /oxygens
  # GET /oxygens.xml
  def index
    @oxygens = Oxygen.paginate :page => params[:page], :order => 'created_at DESC',:per_page => 48

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @oxygens }
    end
  end

  # GET /oxygens/1
  # GET /oxygens/1.xml
  def show
    @oxygen = Oxygen.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @oxygen }
    end
  end

  # GET /oxygens/new
  # GET /oxygens/new.xml
  def new
    @oxygen = Oxygen.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @oxygen }
    end
  end

  # GET /oxygens/1/edit
  def edit
    @oxygen = Oxygen.find(params[:id])
  end

  # POST /oxygens
  # POST /oxygens.xml
  def create
    params.permit!
    @oxygen = Oxygen.new(params[:oxygen])

    respond_to do |format|
      if @oxygen.save
        format.html { redirect_to(@oxygen, :notice => 'Oxygen was successfully created.') }
        format.xml  { render :xml => @oxygen, :status => :created, :location => @oxygen }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @oxygen.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /oxygens/1
  # PUT /oxygens/1.xml
  def update
    params.permit!
    @oxygen = Oxygen.find(params[:id])

    respond_to do |format|
      if @oxygen.update_attributes(params[:oxygen])
        format.html { redirect_to(@oxygen, :notice => 'Oxygen was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @oxygen.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /oxygens/1
  # DELETE /oxygens/1.xml
  def destroy
    @oxygen = Oxygen.find(params[:id])
    @oxygen.destroy

    respond_to do |format|
      format.html { redirect_to(oxygens_url) }
      format.xml  { head :ok }
    end
  end
end
