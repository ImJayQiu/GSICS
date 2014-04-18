class SiliconMetal::PosController < ApplicationController
  before_action :set_silicon_metal_po, only: [:show, :edit, :update, :destroy]

  # GET /silicon_metal/pos
  def index
    @silicon_metal_pos = SiliconMetal::Po.paginate :page => params[:page], 
      :order => 'date DESC, created_at DESC', 
      :per_page => 30
  end

  # GET /silicon_metal/pos/1
  def show
  end

  # GET /silicon_metal/pos/new
  def new
    @silicon_metal_po = SiliconMetal::Po.new
  end

  # GET /silicon_metal/pos/1/edit
  def edit
  end

  # POST /silicon_metal/pos
  def create
    @silicon_metal_po = SiliconMetal::Po.new(silicon_metal_po_params)

    if @silicon_metal_po.save
      redirect_to @silicon_metal_po, notice: 'Po was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /silicon_metal/pos/1
  def update
    if @silicon_metal_po.update(silicon_metal_po_params)
      redirect_to @silicon_metal_po, notice: 'Po was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /silicon_metal/pos/1
  def destroy
    @silicon_metal_po.destroy
    redirect_to silicon_metal_pos_url, notice: 'Po was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_silicon_metal_po
    @silicon_metal_po = SiliconMetal::Po.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def silicon_metal_po_params
    params.require(:silicon_metal_po).permit(:date, :po_code, :customer, :product, :grade, :b_size, :qty, :p_size, :contract_no, :destination, :deadline, :remark)
  end
end
