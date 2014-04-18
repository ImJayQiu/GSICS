class Hr::DeptChangesController < ApplicationController
  # GET /hr/dept_changes
  # GET /hr/dept_changes.xml
  def index
    @hr_dept_changes = Hr::DeptChange.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hr_dept_changes }
    end
  end

  # GET /hr/dept_changes/1
  # GET /hr/dept_changes/1.xml
  def show
    @hr_dept_change = Hr::DeptChange.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hr_dept_change }
    end
  end

  # GET /hr/dept_changes/new
  # GET /hr/dept_changes/new.xml
  def new
    @hr_dept_change = Hr::DeptChange.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hr_dept_change }
    end
  end

  # GET /hr/dept_changes/1/edit
  def edit
    @hr_dept_change = Hr::DeptChange.find(params[:id])
  end

  # POST /hr/dept_changes
  # POST /hr/dept_changes.xml
  def create
    params.permit!
    @hr_dept_change = Hr::DeptChange.new(params[:hr_dept_change])

    respond_to do |format|
      if @hr_dept_change.save
        format.html { redirect_to(@hr_dept_change, :notice => 'Dept change was successfully created.') }
        format.xml  { render :xml => @hr_dept_change, :status => :created, :location => @hr_dept_change }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hr_dept_change.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hr/dept_changes/1
  # PUT /hr/dept_changes/1.xml
  def update
    params.permit!
    @hr_dept_change = Hr::DeptChange.find(params[:id])

    respond_to do |format|
      if @hr_dept_change.update_attributes(params[:hr_dept_change])
        format.html { redirect_to(@hr_dept_change, :notice => 'Dept change was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hr_dept_change.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hr/dept_changes/1
  # DELETE /hr/dept_changes/1.xml
  def destroy
    @hr_dept_change = Hr::DeptChange.find(params[:id])
    @hr_dept_change.destroy

    respond_to do |format|
      format.html { redirect_to(hr_dept_changes_url) }
      format.xml  { head :ok }
    end
  end
end
