class SecurityCasesController < ApplicationController
  # GET /security_cases
  # GET /security_cases.xml
  def index
    @security_cases = SecurityCase.paginate :page => params[:page], :order => 'datetime DESC', :per_page=> 50

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @security_cases }
    end
  end

  # GET /security_cases/1
  # GET /security_cases/1.xml
  def show
    @security_case = SecurityCase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @security_case }
    end
  end

  # GET /security_cases/new
  # GET /security_cases/new.xml
  def new
    @security_case = SecurityCase.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @security_case }
    end
  end

  # GET /security_cases/1/edit
  def edit
    @security_case = SecurityCase.find(params[:id])
  end

  # POST /security_cases
  # POST /security_cases.xml
  def create
    params.permit!
    @security_case = SecurityCase.new(params[:security_case])

    respond_to do |format|
      if @security_case.save
        format.html { redirect_to(@security_case, :notice => 'Security case was successfully created.') }
        format.xml  { render :xml => @security_case, :status => :created, :location => @security_case }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @security_case.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /security_cases/1
  # PUT /security_cases/1.xml
  def update
    params.permit!
    @security_case = SecurityCase.find(params[:id])

    respond_to do |format|
      if @security_case.update_attributes(params[:security_case])
        format.html { redirect_to(@security_case, :notice => 'Security case was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @security_case.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /security_cases/1
  # DELETE /security_cases/1.xml
  def destroy
    @security_case = SecurityCase.find(params[:id])
    @security_case.destroy

    respond_to do |format|
      format.html { redirect_to(security_cases_url) }
      format.xml  { head :ok }
    end
  end
end
