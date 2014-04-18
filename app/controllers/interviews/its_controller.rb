class Interviews::ItsController < ApplicationController
  # GET /interviews/its
  # GET /interviews/its.xml
  def index
    @interviews_its = Interviews::It.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @interviews_its }
    end
  end

  # GET /interviews/its/1
  # GET /interviews/its/1.xml
  def show
    @interviews_it = Interviews::It.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @interviews_it }
    end
  end

  # GET /interviews/its/new
  # GET /interviews/its/new.xml
  def new
    @interviews_it = Interviews::It.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @interviews_it }
    end
  end

  # GET /interviews/its/1/edit
  def edit
    @interviews_it = Interviews::It.find(params[:id])
  end

  # POST /interviews/its
  # POST /interviews/its.xml
  def create
    params.permit!
    @interviews_it = Interviews::It.new(params[:interviews_it])

    respond_to do |format|
      if @interviews_it.save
        format.html { redirect_to(@interviews_it, :notice => 'It was successfully created.') }
        format.xml  { render :xml => @interviews_it, :status => :created, :location => @interviews_it }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @interviews_it.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /interviews/its/1
  # PUT /interviews/its/1.xml
  def update
    params.permit!
    @interviews_it = Interviews::It.find(params[:id])

    respond_to do |format|
      if @interviews_it.update_attributes(params[:interviews_it])
        format.html { redirect_to(@interviews_it, :notice => 'It was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @interviews_it.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /interviews/its/1
  # DELETE /interviews/its/1.xml
  def destroy
    @interviews_it = Interviews::It.find(params[:id])
    @interviews_it.destroy

    respond_to do |format|
      format.html { redirect_to(interviews_its_url) }
      format.xml  { head :ok }
    end
  end
end
