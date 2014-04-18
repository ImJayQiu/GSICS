class SecurityCaseMediaController < ApplicationController
  # GET /security_case_media
  # GET /security_case_media.xml
  def index
    @security_case_media = SecurityCaseMedium.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @security_case_media }
    end
  end

  # GET /security_case_media/1
  # GET /security_case_media/1.xml
  def show
    @security_case_medium = SecurityCaseMedium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @security_case_medium }
    end
  end

  # GET /security_case_media/new
  # GET /security_case_media/new.xml
  def new
    @security_case_medium = SecurityCaseMedium.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @security_case_medium }
    end
  end

  # GET /security_case_media/1/edit
  def edit
    @security_case_medium = SecurityCaseMedium.find(params[:id])
  end

  # POST /security_case_media
  # POST /security_case_media.xml
  def create
    params.permit!
    @security_case_medium = SecurityCaseMedium.new(params[:security_case_medium])

    respond_to do |format|
      if @security_case_medium.save
        format.html { redirect_to(@security_case_medium, :notice => 'Security case medium was successfully created.') }
        format.xml  { render :xml => @security_case_medium, :status => :created, :location => @security_case_medium }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @security_case_medium.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /security_case_media/1
  # PUT /security_case_media/1.xml
  def update
    params.permit!
    @security_case_medium = SecurityCaseMedium.find(params[:id])

    respond_to do |format|
      if @security_case_medium.update_attributes(params[:security_case_medium])
        format.html { redirect_to(@security_case_medium, :notice => 'Security case medium was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @security_case_medium.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /security_case_media/1
  # DELETE /security_case_media/1.xml
  def destroy
    @security_case_medium = SecurityCaseMedium.find(params[:id])
    @security_case_medium.destroy

    respond_to do |format|
      format.html { redirect_to(security_case_media_url) }
      format.xml  { head :ok }
    end
  end
end
