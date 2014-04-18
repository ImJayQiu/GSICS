class SiliconMetal::GposController < ApplicationController
  before_action :set_silicon_metal_gpo, only: [:show, :edit, :update, :destroy]

  # GET /silicon_metal/gpos
  def index
    @silicon_metal_gpos = SiliconMetal::Gpo.all
  end

  # GET /silicon_metal/gpos/1
  def show
  end

  # GET /silicon_metal/gpos/new
  def new
    @silicon_metal_gpo = SiliconMetal::Gpo.new
  end

  # GET /silicon_metal/gpos/1/edit
  def edit
  end

  # POST /silicon_metal/gpos
  def create
    @silicon_metal_gpo = SiliconMetal::Gpo.new(silicon_metal_gpo_params)

    if @silicon_metal_gpo.save
      redirect_to @silicon_metal_gpo, notice: 'Gpo was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /silicon_metal/gpos/1
  def update
    if @silicon_metal_gpo.update(silicon_metal_gpo_params)
      redirect_to @silicon_metal_gpo, notice: 'Gpo was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /silicon_metal/gpos/1
  def destroy
    @silicon_metal_gpo.destroy
    redirect_to silicon_metal_gpos_url, notice: 'Gpo was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_silicon_metal_gpo
      @silicon_metal_gpo = SiliconMetal::Gpo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def silicon_metal_gpo_params
      params.require(:silicon_metal_gpo).permit(:po, :gpo_code, :weight)
    end
end
