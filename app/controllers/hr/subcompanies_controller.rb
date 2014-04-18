class Hr::SubcompaniesController < ApplicationController
  # GET /hr/subcompanies
  # GET /hr/subcompanies.xml
  def index
    @hr_subcompanies = Hr::Subcompany.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hr_subcompanies }
    end
  end

  # GET /hr/subcompanies/1
  # GET /hr/subcompanies/1.xml
  def show
    @hr_subcompany = Hr::Subcompany.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hr_subcompany }
    end
  end

  # GET /hr/subcompanies/new
  # GET /hr/subcompanies/new.xml
  def new
    @hr_subcompany = Hr::Subcompany.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hr_subcompany }
    end
  end

  # GET /hr/subcompanies/1/edit
  def edit
    @hr_subcompany = Hr::Subcompany.find(params[:id])
  end

  # POST /hr/subcompanies
  # POST /hr/subcompanies.xml
  def create
    params.permit!
    @hr_subcompany = Hr::Subcompany.new(params[:hr_subcompany])

    respond_to do |format|
      if @hr_subcompany.save
        format.html { redirect_to(@hr_subcompany, :notice => 'Subcompany was successfully created.') }
        format.xml  { render :xml => @hr_subcompany, :status => :created, :location => @hr_subcompany }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hr_subcompany.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hr/subcompanies/1
  # PUT /hr/subcompanies/1.xml
  def update
    params.permit!
    @hr_subcompany = Hr::Subcompany.find(params[:id])

    respond_to do |format|
      if @hr_subcompany.update_attributes(params[:hr_subcompany])
        format.html { redirect_to(@hr_subcompany, :notice => 'Subcompany was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hr_subcompany.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hr/subcompanies/1
  # DELETE /hr/subcompanies/1.xml
  def destroy
    @hr_subcompany = Hr::Subcompany.find(params[:id])
    @hr_subcompany.destroy

    respond_to do |format|
      format.html { redirect_to(hr_subcompanies_url) }
      format.xml  { head :ok }
    end
  end
end
