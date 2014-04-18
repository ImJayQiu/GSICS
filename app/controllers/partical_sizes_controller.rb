class ParticalSizesController < ApplicationController
  # GET /partical_sizes
  # GET /partical_sizes.xml
  def index
    @partical_sizes = ParticalSize.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @partical_sizes }
    end
  end

  # GET /partical_sizes/1
  # GET /partical_sizes/1.xml
  def show
    @partical_size = ParticalSize.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @partical_size }
    end
  end

  # GET /partical_sizes/new
  # GET /partical_sizes/new.xml
  def new
    @partical_size = ParticalSize.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @partical_size }
    end
  end

  # GET /partical_sizes/1/edit
  def edit
    @partical_size = ParticalSize.find(params[:id])
  end

  # POST /partical_sizes
  # POST /partical_sizes.xml
  def create
    params.permit!
    @partical_size = ParticalSize.new(params[:partical_size])

    respond_to do |format|
      if @partical_size.save
        format.html { redirect_to(@partical_size, :notice => 'Partical size was successfully created.') }
        format.xml  { render :xml => @partical_size, :status => :created, :location => @partical_size }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @partical_size.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /partical_sizes/1
  # PUT /partical_sizes/1.xml
  def update
    params.permit!
    @partical_size = ParticalSize.find(params[:id])

    respond_to do |format|
      if @partical_size.update_attributes(params[:partical_size])
        format.html { redirect_to(@partical_size, :notice => 'Partical size was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @partical_size.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /partical_sizes/1
  # DELETE /partical_sizes/1.xml
  def destroy
    @partical_size = ParticalSize.find(params[:id])
    @partical_size.destroy

    respond_to do |format|
      format.html { redirect_to(partical_sizes_url) }
      format.xml  { head :ok }
    end
  end
end
