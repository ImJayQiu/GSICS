class SiInventoryContentsController < ApplicationController
  # GET /si_inventory_contents
  # GET /si_inventory_contents.xml
  def index
    @si_inventory_contents = SiInventoryContent.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @si_inventory_contents }
    end
  end

  # GET /si_inventory_contents/1
  # GET /si_inventory_contents/1.xml
  def show
    @si_inventory_content = SiInventoryContent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @si_inventory_content }
    end
  end

  # GET /si_inventory_contents/new
  # GET /si_inventory_contents/new.xml
  def new
    @si_inventory_content = SiInventoryContent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @si_inventory_content }
    end
  end

  # GET /si_inventory_contents/1/edit
  def edit
    @si_inventory_content = SiInventoryContent.find(params[:id])
  end

  # POST /si_inventory_contents
  # POST /si_inventory_contents.xml
  def create
    params.permit!
    @si_inventory_content = SiInventoryContent.new(params[:si_inventory_content])

    respond_to do |format|
      if @si_inventory_content.save
        format.html { redirect_to(@si_inventory_content, :notice => 'Si inventory content was successfully created.') }
        format.xml  { render :xml => @si_inventory_content, :status => :created, :location => @si_inventory_content }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @si_inventory_content.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /si_inventory_contents/1
  # PUT /si_inventory_contents/1.xml
  def update
    params.permit!
    @si_inventory_content = SiInventoryContent.find(params[:id])

    respond_to do |format|
      if @si_inventory_content.update_attributes(params[:si_inventory_content])
        format.html { redirect_to(@si_inventory_content, :notice => 'Si inventory content was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @si_inventory_content.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /si_inventory_contents/1
  # DELETE /si_inventory_contents/1.xml
  def destroy
    @si_inventory_content = SiInventoryContent.find(params[:id])
    @si_inventory_content.destroy

    respond_to do |format|
      format.html { redirect_to(si_inventory_contents_url) }
      format.xml  { head :ok }
    end
  end
end
