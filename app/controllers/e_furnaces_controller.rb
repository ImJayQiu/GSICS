#coding: utf-8
class EFurnacesController < ApplicationController
  # GET /e_furnaces
  # GET /e_furnaces.xml
  def index
    @e_furnaces = EFurnace.paginate :page => params[:page], :order => 'date DESC',:per_page => 30

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @e_furnaces }
    end
  end

  # GET /e_furnaces/1
  # GET /e_furnaces/1.xml
  def show
    @e_furnace = EFurnace.find(params[:id])
    
    @electrode_a_sum = 
      @e_furnace.s1_electrode_a +
      @e_furnace.s2_electrode_a +
      @e_furnace.s3_electrode_a rescue nil
    
    @electrode_b_sum= 
      @e_furnace.s1_electrode_b +
      @e_furnace.s2_electrode_b +
      @e_furnace.s3_electrode_b rescue nil
    
    @electrode_c_sum= 
      @e_furnace.s1_electrode_c +
      @e_furnace.s2_electrode_c +
      @e_furnace.s3_electrode_c rescue nil
    
    @electrode_all_sum = @electrode_a_sum + @electrode_b_sum + @electrode_c_sum rescue nil

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @e_furnace }
    end
  end

  # GET /e_furnaces/new
  # GET /e_furnaces/new.xml
  def new
    @e_furnace = EFurnace.new
    @s1_e = @s1_rp = @s1_q = @s1_ch = @s1_w = @s1_c = @s1_fe = "0"
    @s2_e = @s2_rp = @s2_q = @s2_ch = @s2_w = @s2_c = @s2_fe = "0"
    @s3_e = @s3_rp = @s3_q = @s3_ch = @s3_w = @s3_c = @s3_fe = "0"
    
    @s1_electrode_a = @s1_electrode_b = @s1_electrode_c = "0"
    @s2_electrode_a = @s2_electrode_b = @s2_electrode_c = "0"
    @s3_electrode_a = @s3_electrode_b = @s3_electrode_c = "0"
   
    
    @remark = "无 | Null"
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @e_furnace }
    end
  end

  # GET /e_furnaces/1/edit
  def edit
    @e_furnace = EFurnace.find(params[:id])
    
    @s1_e=@e_furnace.s1_e and @s2_e=@e_furnace.s2_e and @s3_e=@e_furnace.s3_e
    @s1_rp=@e_furnace.s1_rp and @s2_rp=@e_furnace.s2_rp and @s3_rp=@e_furnace.s3_rp
    @s1_q=@e_furnace.s1_q and @s2_q=@e_furnace.s2_q and @s3_q=@e_furnace.s3_q
    @s1_ch=@e_furnace.s1_ch and @s2_ch=@e_furnace.s2_ch and @s3_ch=@e_furnace.s3_ch 
    @s1_w=@e_furnace.s1_w and @s2_w=@e_furnace.s2_w and @s3_w=@e_furnace.s3_w
    @s1_c=@e_furnace.s1_c and @s2_c=@e_furnace.s2_c and @s3_c=@e_furnace.s3_c
    @s1_fe=@e_furnace.s1_fe and @s2_fe=@e_furnace.s2_fe and @s3_fe=@e_furnace.s3_fe
    @s1_electrode_a=@e_furnace.s1_electrode_a and @s1_electrode_b=@e_furnace.s1_electrode_b and @s1_electrode_c=@e_furnace.s1_electrode_c
    @s2_electrode_a=@e_furnace.s2_electrode_a and @s2_electrode_b=@e_furnace.s2_electrode_b and @s2_electrode_c=@e_furnace.s2_electrode_c
    @s3_electrode_a=@e_furnace.s3_electrode_a and @s3_electrode_b=@e_furnace.s3_electrode_b and @s3_electrode_c=@e_furnace.s3_electrode_c
    
    @remark = @e_furnace.remark
  end

  # POST /e_furnaces
  # POST /e_furnaces.xml
  def create
    params.permit!
    @e_furnace = EFurnace.new(params[:e_furnace])
    
    respond_to do |format|
      if @e_furnace.save
        format.html { redirect_to(@e_furnace, :notice => '硅 炉 运 行 记 录 创 建 成 功 ！ \n\n Furnace Running Record Was Successfully Created.') }
        format.xml  { render :xml => @e_furnace, :status => :created, :location => @e_furnace }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @e_furnace.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /e_furnaces/1
  # PUT /e_furnaces/1.xml
  def update
    params.permit!
    @e_furnace = EFurnace.find(params[:id])

    respond_to do |format|
      if @e_furnace.update_attributes(params[:e_furnace])
        format.html { redirect_to(@e_furnace, :notice => '硅 炉 运 行 记 录 更 新 ！ \n\n Furnace Running Record Was Successfully Updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @e_furnace.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /e_furnaces/1
  # DELETE /e_furnaces/1.xml
  def destroy
    @e_furnace = EFurnace.find(params[:id])
    @e_furnace.destroy

    respond_to do |format|
      format.html { redirect_to(e_furnaces_url) }
      format.xml  { head :ok }
    end
  end
  
  
  
  def summary
    
    if params[:start_date] && params[:end_date]
      @s_date=params[:start_date].to_date
      @e_date=params[:end_date].to_date
      @date=@s_date..@e_date
    end
    
    @silicons = Silicon.where(:date=>@date)
    @total_silicon_weight = @silicons.sum(:weight)
    
    @expense=EFurnace.where(:date=>@date)
    @f_expense = @expense.group_by { |f|f.furnace }.sort
    
    @total_power=@expense.sum(:s1_e)+@expense.sum(:s2_e)+@expense.sum(:s3_e) rescue nil
    @total_quartz=@expense.sum(:s1_q)+@expense.sum(:s2_q)+@expense.sum(:s3_q) rescue nil
    @total_charcoal=@expense.sum(:s1_ch)+@expense.sum(:s2_ch)+@expense.sum(:s3_ch) rescue nil
    @total_wood=@expense.sum(:s1_w)+@expense.sum(:s2_w)+@expense.sum(:s3_w) rescue nil
    @total_coke=@expense.sum(:s1_c)+@expense.sum(:s2_c)+@expense.sum(:s3_c) rescue nil
    @total_fe=@expense.sum(:s1_fe)+@expense.sum(:s2_fe)+@expense.sum(:s3_fe) rescue nil
    @total_electrode=
      @expense.sum(:s1_electrode_a)+@expense.sum(:s1_electrode_b)+@expense.sum(:s1_electrode_c)+
      @expense.sum(:s2_electrode_a)+@expense.sum(:s2_electrode_b)+@expense.sum(:s2_electrode_c)+
      @expense.sum(:s3_electrode_a)+@expense.sum(:s3_electrode_b)+@expense.sum(:s3_electrode_c) rescue nil
  
  end
  
  
  
end
