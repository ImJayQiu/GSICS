class SilicashipsController < ApplicationController
  # GET /silicaships
  # GET /silicaships.xml
  def index
    @silicaships = Silicaship.paginate :page => params[:page], :order => 'created_at DESC, date DESC',:per_page => 15

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @silicaships }
    end
  end

  # GET /silicaships/1
  # GET /silicaships/1.xml
  def show
    @silicaship = Silicaship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @silicaship }
    end
  end

  # GET /silicaships/new
  # GET /silicaships/new.xml
  def new
    @silicaship = Silicaship.new
    @form_code = "PKI-"+Date.current.strftime('%Y%m%d')+"-"+"#{Silicaship.where('created_at BETWEEN ? and ?', Date.current.beginning_of_month, Date.current.end_of_month).count+1}"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @silicaship }
    end
  end

  # GET /silicaships/1/edit
  def edit
    @silicaship = Silicaship.find(params[:id])
    @form_code = @silicaship.code
  end

  # POST /silicaships
  # POST /silicaships.xml
  def create
    params.permit!
    @silicaship = Silicaship.new(params[:silicaship])

    respond_to do |format|
      if @silicaship.save
        format.html { redirect_to(@silicaship, :notice => 'Silicon Metal Shipping Record was successfully created.') }
        format.xml  { render :xml => @silicaship, :status => :created, :location => @silicaship }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @silicaship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /silicaships/1
  # PUT /silicaships/1.xml
  def update
    params.permit!
    @silicaship = Silicaship.find(params[:id])

    respond_to do |format|
      if @silicaship.update_attributes(params[:silicaship])
        format.html { redirect_to(@silicaship, :notice => 'Silicaship was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @silicaship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /silicaships/1
  # DELETE /silicaships/1.xml
  def destroy
    @silicaship = Silicaship.find(params[:id])
    @silicaship.destroy

    respond_to do |format|
      format.html { redirect_to(silicaships_url) }
      format.xml  { head :ok }
    end
  end
end
