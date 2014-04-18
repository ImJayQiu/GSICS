class DailyreportJobsController < ApplicationController
  # GET /dailyreport_jobs
  # GET /dailyreport_jobs.xml
  def index
    @dailyreport_jobs = DailyreportJob.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dailyreport_jobs }
    end
  end

  # GET /dailyreport_jobs/1
  # GET /dailyreport_jobs/1.xml
  def show
    @dailyreport_job = DailyreportJob.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dailyreport_job }
    end
  end

  # GET /dailyreport_jobs/new
  # GET /dailyreport_jobs/new.xml
  def new
    @dailyreport_job = DailyreportJob.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dailyreport_job }
    end
  end

  # GET /dailyreport_jobs/1/edit
  def edit
    @dailyreport_job = DailyreportJob.find(params[:id])
  end

  # POST /dailyreport_jobs
  # POST /dailyreport_jobs.xml
  def create
    params.permit!
    @dailyreport_job = DailyreportJob.new(params[:dailyreport_job])

    respond_to do |format|
      if @dailyreport_job.save
        format.html { redirect_to(@dailyreport_job, :notice => 'Dailyreport job was successfully created.') }
        format.xml  { render :xml => @dailyreport_job, :status => :created, :location => @dailyreport_job }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @dailyreport_job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dailyreport_jobs/1
  # PUT /dailyreport_jobs/1.xml
  def update
    params.permit!
    @dailyreport_job = DailyreportJob.find(params[:id])

    respond_to do |format|
      if @dailyreport_job.update_attributes(params[:dailyreport_job])
        format.html { redirect_to(@dailyreport_job, :notice => 'Dailyreport job was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @dailyreport_job.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dailyreport_jobs/1
  # DELETE /dailyreport_jobs/1.xml
  def destroy
    @dailyreport_job = DailyreportJob.find(params[:id])
    @dailyreport_job.destroy

    respond_to do |format|
      format.html { redirect_to(dailyreport_jobs_url) }
      format.xml  { head :ok }
    end
  end
end
