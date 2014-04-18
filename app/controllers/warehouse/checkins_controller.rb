class Warehouse::CheckinsController < ApplicationController
  before_action :set_warehouse_checkin, only: [:show, :edit, :update, :destroy]

  # GET /warehouse/checkins
  def index
    @warehouse_checkins = Warehouse::Checkin.paginate :page => params[:page], 
      :order => 'date DESC, created_at DESC', 
      :per_page => 30
    
  end

  # GET /warehouse/checkins/1
  def show
    
    @item = Purchase::Request.where(code: @warehouse_checkin.p_code).first rescue nil
    
    if @warehouse_checkin.remark.blank?  
      @w_remark = "No Remark Available !" 
    else 
      @w_remark = @warehouse_checkin.remark 
    end
    
  end

  # GET /warehouse/checkins/new
  def new
    @warehouse_checkin = Warehouse::Checkin.new
  end

  # GET /warehouse/checkins/1/edit
  def edit
  end

  # POST /warehouse/checkins
  def create
    @warehouse_checkin = Warehouse::Checkin.new(warehouse_checkin_params)

    if @warehouse_checkin.save
      redirect_to @warehouse_checkin, notice: 'Checkin was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /warehouse/checkins/1
  def update
    if @warehouse_checkin.update(warehouse_checkin_params)
      redirect_to @warehouse_checkin, notice: 'Checkin was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /warehouse/checkins/1
  def destroy
    @warehouse_checkin.destroy
    redirect_to warehouse_checkins_url, notice: 'Checkin was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_warehouse_checkin
    @warehouse_checkin = Warehouse::Checkin.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def warehouse_checkin_params
    params.require(:warehouse_checkin).permit(:date, :p_code, :item_code, :w_qty, :remark, :operator)
  end
end
