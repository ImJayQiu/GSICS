#coding = utf-8

class QuartzsController < ApplicationController
  # GET /quartzs
  # GET /quartzs.xml
  def index
    
    @quartzs = Quartz.paginate :page => params[:page], :order => 'created_at DESC, code DESC',:per_page => 30
    
    @quartzs_all = Quartz.all
    @quartz_color = @quartzs_all.group_by{|q|q.color}
    #@quartz_supplier = @quartzs.group_by{|q|q.supplier}
    
    @color_all = [] 
    @quartz_color.each do |color, q|
      @color_all << color  
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quartzs }
    end
  end

  # GET /quartzs/1
  # GET /quartzs/1.xml
  def show
    @quartz = Quartz.find(params[:id])
    
    @supplier = Supplier.where("code=?", @quartz.supplier ).first
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quartz }
    end
  end

  # GET /quartzs/new
  # GET /quartzs/new.xml
  def new
    @quartz = Quartz.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quartz }
    end
  end

  # GET /quartzs/1/edit
  def edit
    @quartz = Quartz.find(params[:id])
  end

  # POST /quartzs
  # POST /quartzs.xml
  def create
    
    params.permit!
    @quartz = Quartz.new(params[:quartz])

    respond_to do |format|
      if @quartz.save
        format.html { redirect_to(@quartz, :notice => 'Quartz was successfully created.') }
        format.xml  { render :xml => @quartz, :status => :created, :location => @quartz }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quartz.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quartzs/1
  # PUT /quartzs/1.xml
  def update
    params.permit!
    @quartz = Quartz.find(params[:id])

    respond_to do |format|
      if @quartz.update_attributes(params[:quartz])
        format.html { redirect_to(@quartz, :notice => 'Quartz was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quartz.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quartzs/1
  # DELETE /quartzs/1.xml
  def destroy
    @quartz = Quartz.find(params[:id])
    @quartz.destroy

    respond_to do |format|
      format.html { redirect_to(quartzs_url) }
      format.xml  { head :ok }
    end
  end
  
  
   private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def person_params
      params.require(:person).permit(:name, :age)
    end
  
  
  
end
