class SiliconMetal::SiShippingsController < ApplicationController
  before_action :set_silicon_metal_si_shipping, only: [:show, :edit, :update, :destroy]

  # GET /silicon_metal/si_shippings
  def index
    @silicon_metal_si_shippings = SiliconMetal::SiShipping.paginate :page => params[:page], 
      :order => 'date DESC, created_at DESC', 
      :per_page => 30
  end

  # GET /silicon_metal/si_shippings/1
  def show
    @shipping_details=SiInventory.where(:container_no=>@silicon_metal_si_shipping.container_no) rescue nil
    @total_weight = @shipping_details.sum(:weight)
  end

  # GET /silicon_metal/si_shippings/new
  def new
    @silicon_metal_si_shipping = SiliconMetal::SiShipping.new
 
  end

  # GET /silicon_metal/si_shippings/1/edit
  def edit
  end

  # POST /silicon_metal/si_shippings
  def create
    @silicon_metal_si_shipping = SiliconMetal::SiShipping.new(silicon_metal_si_shipping_params)

    if @silicon_metal_si_shipping.save
      redirect_to @silicon_metal_si_shipping, notice: 'Silicon Metal Shipping Was Successfully Created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /silicon_metal/si_shippings/1
  def update
    if @silicon_metal_si_shipping.update(silicon_metal_si_shipping_params)
      redirect_to @silicon_metal_si_shipping, notice: 'Si shipping was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /silicon_metal/si_shippings/1
  def destroy
    @silicon_metal_si_shipping.destroy
    redirect_to silicon_metal_si_shippings_url, notice: 'Si shipping was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_silicon_metal_si_shipping
    @silicon_metal_si_shipping = SiliconMetal::SiShipping.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def silicon_metal_si_shipping_params
    params.require(:silicon_metal_si_shipping).permit(:date, :container_no, :operator, :remark)
  end
end
