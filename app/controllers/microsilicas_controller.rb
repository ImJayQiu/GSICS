#coding: utf-8

class MicrosilicasController < ApplicationController
  # GET /microsilicas
  # GET /microsilicas.xml
  
  layout 'main', :except => :popup
  
  def index
    
    @microsilica = Microsilica.new
    @microsilicas = Microsilica.paginate :page => params[:page], :order => 'date DESC, silo, bag DESC', :per_page => 200
    @microsilicas_group = @microsilicas.group_by {|m|m.silo}
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @microsilicas }
    end
  end

  # GET /microsilicas/1
  # GET /microsilicas/1.xml
  def show
    @microsilica = Microsilica.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @microsilica }
    end
  end

  # GET /microsilicas/new
  # GET /microsilicas/new.xml
  def new
    @microsilica = Microsilica.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @microsilica }
    end
  end

  # GET /microsilicas/1/edit
  def edit
    @microsilica = Microsilica.find(params[:id])
  end

  # POST /microsilicas
  # POST /microsilicas.xml
  def create
    params.permit!
    @microsilica = Microsilica.new(params[:microsilica])

    respond_to do |format|
      if @microsilica.save
        format.html { redirect_to(@microsilica, :notice => " 微 硅 粉 包 装 记 录 添 加 成 功！ \n\n  Microsilica was successfully created !") }
        format.xml  { render :xml => @microsilica, :status => :created, :location => @microsilica }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @microsilica.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /microsilicas/1
  # PUT /microsilicas/1.xml
  def update
    params.permit!
    @microsilica = Microsilica.find(params[:id])

    respond_to do |format|
      if @microsilica.update_attributes(params[:microsilica])
        format.html { redirect_to(@microsilica, :notice => '微 硅 粉 包 装 记 录 更 新 ! \n\n Microsilica was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @microsilica.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  
  def popup
    @microsilica = Microsilica.find(params[:id])
  end
  
  
  
  # DELETE /microsilicas/1
  # DELETE /microsilicas/1.xml
  def destroy
    @microsilica = Microsilica.find(params[:id])
    @microsilica.destroy

    respond_to do |format|
      format.html { redirect_to(microsilicas_url) }
      format.xml  { head :ok }
    end
  end
end
