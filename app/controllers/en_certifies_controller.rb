class EnCertifiesController < ApplicationController
  # GET /en_certifies
  # GET /en_certifies.xml
  def index
    @en_certifies = EnCertify.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @en_certifies }
    end
  end

  # GET /en_certifies/1
  # GET /en_certifies/1.xml
  def show
    @en_certify = EnCertify.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @en_certify }
    end
  end

  # GET /en_certifies/new
  # GET /en_certifies/new.xml
  def new
    @en_certify = EnCertify.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @en_certify }
    end
  end

  # GET /en_certifies/1/edit
  def edit
    @en_certify = EnCertify.find(params[:id])
  end

  # POST /en_certifies
  # POST /en_certifies.xml
  def create
    params.permit!
    @en_certify = EnCertify.new(params[:en_certify])

    respond_to do |format|
      if @en_certify.save
        format.html { redirect_to(@en_certify, :notice => 'En certify was successfully created.') }
        format.xml  { render :xml => @en_certify, :status => :created, :location => @en_certify }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @en_certify.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /en_certifies/1
  # PUT /en_certifies/1.xml
  def update
    params.permit!
    @en_certify = EnCertify.find(params[:id])

    respond_to do |format|
      if @en_certify.update_attributes(params[:en_certify])
        format.html { redirect_to(@en_certify, :notice => 'En certify was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @en_certify.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /en_certifies/1
  # DELETE /en_certifies/1.xml
  def destroy
    @en_certify = EnCertify.find(params[:id])
    @en_certify.destroy

    respond_to do |format|
      format.html { redirect_to(en_certifies_url) }
      format.xml  { head :ok }
    end
  end
end
