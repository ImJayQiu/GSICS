class CoasController < ApplicationController
  # GET /coas
  # GET /coas.xml
  def index
    @coas = Coa.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @coas }
    end
  end

  # GET /coas/1
  # GET /coas/1.xml
  def show
    @coa = Coa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @coa }
    end
  end

  # GET /coas/new
  # GET /coas/new.xml
  def new
    @coa = Coa.new
    
    if params[:fur] && params[:date]&& params[:shift]&& params[:no]
      
      furnace = params[:fur]
      date = Date.civil(params[:date][:"(1i)"].to_i,params[:date][:"(2i)"].to_i,params[:date][:"(3i)"].to_i)
      shift = params[:shift]
      no = params[:no]
      
      @silicon=Silicon.where( :date=>date, :furnace=>furnace, :shift=>shift, :no=>no)
    end
    
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @coa }
    end   
  end

  # GET /coas/1/edit
  def edit
    @coa = Coa.find(params[:id])
  end

  # POST /coas
  # POST /coas.xml
  def create
    params.permit!
    @coa = Coa.new(params[:coa])

    respond_to do |format|
      if @coa.save
        format.html { redirect_to(@coa, :notice => 'Coa was successfully created.') }
        format.xml  { render :xml => @coa, :status => :created, :location => @coa }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @coa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /coas/1
  # PUT /coas/1.xml
  def update
    params.permit!
    @coa = Coa.find(params[:id])

    respond_to do |format|
      if @coa.update_attributes(params[:coa])
        format.html { redirect_to(@coa, :notice => 'Coa was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @coa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /coas/1
  # DELETE /coas/1.xml
  def destroy
    @coa = Coa.find(params[:id])
    @coa.destroy

    respond_to do |format|
      format.html { redirect_to(coas_url) }
      format.xml  { head :ok }
    end
  end
end
