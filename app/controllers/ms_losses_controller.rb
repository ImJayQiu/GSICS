class MsLossesController < ApplicationController
  # GET /ms_losses
  # GET /ms_losses.xml
  def index
    @ms_losses = MsLoss.all :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ms_losses }
    end
  end

  # GET /ms_losses/1
  # GET /ms_losses/1.xml
  def show
    @ms_loss = MsLoss.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ms_loss }
    end
  end

  # GET /ms_losses/new
  # GET /ms_losses/new.xml
  def new
    @ms_loss = MsLoss.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ms_loss }
    end
  end

  # GET /ms_losses/1/edit
  def edit
    @ms_loss = MsLoss.find(params[:id])
  end

  # POST /ms_losses
  # POST /ms_losses.xml
  def create
    params.permit!
    @ms_loss = MsLoss.new(params[:ms_loss])

    respond_to do |format|
      if @ms_loss.save
        format.html { redirect_to(@ms_loss, :notice => 'Ms loss was successfully created.') }
        format.xml  { render :xml => @ms_loss, :status => :created, :location => @ms_loss }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ms_loss.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ms_losses/1
  # PUT /ms_losses/1.xml
  def update
    params.permit!
    @ms_loss = MsLoss.find(params[:id])

    respond_to do |format|
      if @ms_loss.update_attributes(params[:ms_loss])
        format.html { redirect_to(@ms_loss, :notice => 'Ms loss was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ms_loss.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ms_losses/1
  # DELETE /ms_losses/1.xml
  def destroy
    @ms_loss = MsLoss.find(params[:id])
    @ms_loss.destroy

    respond_to do |format|
      format.html { redirect_to(ms_losses_url) }
      format.xml  { head :ok }
    end
  end
end
