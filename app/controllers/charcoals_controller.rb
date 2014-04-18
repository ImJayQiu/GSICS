#coding: utf-8

class CharcoalsController < ApplicationController
  # GET /charcoals
  # GET /charcoals.xml
  layout "main", :except => :print_charcoal_popup
  
  def index
    
     
    @charcoals = Charcoal.paginate :page => params[:page], :order => 'form_code DESC',:per_page => 40
    
    #    @charcoals = Charcoal.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @charcoals }
    end
  
  end

  # GET /charcoals/1
  # GET /charcoals/1.xml
  def show
   
    @charcoal = Charcoal.find(params[:id])
    
    if @charcoal.partical_weight.nil?
      
      @test_method="Warehouse"
      @partical_measurement = "Operating"
      
    else
      
      if @charcoal.partical_weight == 0 and @charcoal.charcoal_dusts.count == 0
        
        @test_method="Not Test"
        @partical_measurement = ""
        
      elsif @charcoal.partical_weight > 0  
      
        @test_method="Fully Test"
        @partical_measurement = "#{@charcoal.partical_weight} Kg"
      
      else
        
        @test_method="Sampling Test"
        @partical_measurement = "#{(@charcoal.charcoal_dusts.sum("pweight").to_f * 100 / @charcoal.charcoal_dusts.sum("bweight").to_f).round(2) } %" rescue nil   
        
      end
    end 
    
    
    @supplier = Supplier.where( "code=?", @charcoal.su_code ).first

    if @charcoal.t1.blank?
      @t1result = "N/A"
    else if @charcoal.t1.to_f < 7.00
        @t1color = "#00FF00" and @t1result = "Pass"
      else
        @t1color = "#FF0000" and @t1result = "Fail"
      end
    end
    
    if @charcoal.t2.blank?
      @t2result = "N/A"
    else if @charcoal.t2.to_f < 3.00
        @t2color = "#00FF00" and @t2result = "Pass"
      else
        @t2color = "#FF0000" and @t2result = "Fail"
      end
    end
    
    if @charcoal.t4.blank?
      @t4result = "N/A" 
    else if @charcoal.t4.to_f > 70.00
        @t4color = "#00FF00" and @t4result = "Pass"
      else
        @t4color = "#FF0000" and @t4result = "Fail"
      end
    end
    
    
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @charcoal }
    end
  end

  # GET /charcoals/new
  # GET /charcoals/new.xml
  def new
    @charcoal = Charcoal.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @charcoal }
    end
  end

  # GET /charcoals/1/edit
  def edit
    @charcoal = Charcoal.find(params[:id])
  end

  # POST /charcoals
  # POST /charcoals.xml
  def create
    params.permit!
    @charcoal = Charcoal.new(params[:charcoal])

    respond_to do |format|
      if @charcoal.save
        format.html { redirect_to(@charcoal, :notice => 'Charcoal was successfully created.') }
        format.xml  { render :xml => @charcoal, :status => :created, :location => @charcoal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @charcoal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /charcoals/1
  # PUT /charcoals/1.xml
  def update
    params.permit!
    @charcoal = Charcoal.find(params[:id])

    respond_to do |format|
      if @charcoal.update_attributes(params[:charcoal])
        format.html { redirect_to(@charcoal, :notice => 'Charcoal was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @charcoal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /charcoals/1
  # DELETE /charcoals/1.xml
  def destroy
    @charcoal = Charcoal.find(params[:id])
    @charcoal.destroy

    respond_to do |format|
      format.html { redirect_to(charcoals_url) }
      format.xml  { head :ok }
    end
  end
  
  
  
  def print_charcoal_popup
    
    @charcoal = Charcoal.find(params[:id])
    
    if @charcoal.partical_weight.nil? 
      @partical_measurement = "#{(@charcoal.charcoal_dusts.sum("pweight").to_f * 100 / @charcoal.charcoal_dusts.sum("bweight").to_f).round(2) } %" rescue nil   
      @test_method="Sampling Test"
    else
      @partical_measurement = "#{@charcoal.partical_weight} Kg"
      @test_method="Fully Test"
      
    end
    
    
    @supplier = Supplier.where( "code=?", @charcoal.su_code ).first

    if @charcoal.t1.blank?
      @t1result = "N/A"
    else if @charcoal.t1.to_f < 7.00
        @t1color = "#00FF00" and @t1result = "Pass"
      else
        @t1color = "#FF0000" and @t1result = "Fail"
      end
    end
    
    if @charcoal.t2.blank?
      @t2result = "N/A"
    else if @charcoal.t2.to_f < 3.00
        @t2color = "#00FF00" and @t2result = "Pass"
      else
        @t2color = "#FF0000" and @t2result = "Fail"
      end
    end
    
    if @charcoal.t4.blank?
      @t4result = "N/A" 
    else if @charcoal.t4.to_f > 70.00
        @t4color = "#00FF00" and @t4result = "Pass"
      else
        @t4color = "#FF0000" and @t4result = "Fail"
      end
    end
    
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @charcoal }
    end
    
  end #end of print_charcoal_popup
  
  
end #end of class
