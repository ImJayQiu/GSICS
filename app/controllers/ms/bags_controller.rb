class Ms::BagsController < ApplicationController
  # GET /ms/bags
  # GET /ms/bags.xml
  def index
    @ms_bags = Ms::Bag.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ms_bags }
    end
  end

  # GET /ms/bags/1
  # GET /ms/bags/1.xml
  def show
    @ms_bag = Ms::Bag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ms_bag }
    end
  end

  # GET /ms/bags/new
  # GET /ms/bags/new.xml
  def new
    @ms_bag = Ms::Bag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ms_bag }
    end
  end

  # GET /ms/bags/1/edit
  def edit
    @ms_bag = Ms::Bag.find(params[:id])
  end

  # POST /ms/bags
  # POST /ms/bags.xml
  def create
    params.permit!
    @ms_bag = Ms::Bag.new(params[:ms_bag])

    respond_to do |format|
      if @ms_bag.save
        format.html { redirect_to(@ms_bag, :notice => 'Bag was successfully created.') }
        format.xml  { render :xml => @ms_bag, :status => :created, :location => @ms_bag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ms_bag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ms/bags/1
  # PUT /ms/bags/1.xml
  def update
    params.permit!
    @ms_bag = Ms::Bag.find(params[:id])

    respond_to do |format|
      if @ms_bag.update_attributes(params[:ms_bag])
        format.html { redirect_to(@ms_bag, :notice => 'Bag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ms_bag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ms/bags/1
  # DELETE /ms/bags/1.xml
  def destroy
    @ms_bag = Ms::Bag.find(params[:id])
    @ms_bag.destroy

    respond_to do |format|
      format.html { redirect_to(ms_bags_url) }
      format.xml  { head :ok }
    end
  end
end
