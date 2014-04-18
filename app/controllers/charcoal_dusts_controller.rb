class CharcoalDustsController < ApplicationController
  # GET /charcoal_dusts
  # GET /charcoal_dusts.xml
  def index
    @charcoal_dusts = CharcoalDust.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @charcoal_dusts }
    end
  end

  # GET /charcoal_dusts/1
  # GET /charcoal_dusts/1.xml
  def show
    @charcoal_dust = CharcoalDust.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @charcoal_dust }
    end
  end

  # GET /charcoal_dusts/new
  # GET /charcoal_dusts/new.xml
  def new
    @charcoal_dust = CharcoalDust.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @charcoal_dust }
    end
  end

  # GET /charcoal_dusts/1/edit
  def edit
    @charcoal_dust = CharcoalDust.find(params[:id])
  end

  # POST /charcoal_dusts
  # POST /charcoal_dusts.xml
  def create
    params.permit!
    @charcoal_dust = CharcoalDust.new(params[:charcoal_dust])

    respond_to do |format|
      if @charcoal_dust.save
        format.html { redirect_to(@charcoal_dust, :notice => 'Charcoal dust was successfully created.') }
        format.xml  { render :xml => @charcoal_dust, :status => :created, :location => @charcoal_dust }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @charcoal_dust.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /charcoal_dusts/1
  # PUT /charcoal_dusts/1.xml
  def update
    params.permit!
    @charcoal_dust = CharcoalDust.find(params[:id])

    respond_to do |format|
      if @charcoal_dust.update_attributes(params[:charcoal_dust])
        format.html { redirect_to(@charcoal_dust, :notice => 'Charcoal dust was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @charcoal_dust.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /charcoal_dusts/1
  # DELETE /charcoal_dusts/1.xml
  def destroy
    @charcoal_dust = CharcoalDust.find(params[:id])
    @charcoal_dust.destroy

    respond_to do |format|
      format.html { redirect_to(charcoal_dusts_url) }
      format.xml  { head :ok }
    end
  end
end
