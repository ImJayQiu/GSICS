class SiliconMetal::MixBagsController < ApplicationController
  before_action :set_silicon_metal_mix_bag, only: [:show, :edit, :update, :destroy]

  # GET /silicon_metal/mix_bags
  def index
    @silicon_metal_mix_bags = SiliconMetal::MixBag.paginate :page => params[:page], 
      :order => 'date DESC, created_at DESC', 
      :per_page => 30
  end

  # GET /silicon_metal/mix_bags/1
  def show
  end

  # GET /silicon_metal/mix_bags/new
  def new
    @silicon_metal_mix_bag = SiliconMetal::MixBag.new
  end

  # GET /silicon_metal/mix_bags/1/edit
  def edit
  end

  # POST /silicon_metal/mix_bags
  def create
    @silicon_metal_mix_bag = SiliconMetal::MixBag.new(silicon_metal_mix_bag_params)

    if @silicon_metal_mix_bag.save
      redirect_to @silicon_metal_mix_bag, notice: 'Mix bag was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /silicon_metal/mix_bags/1
  def update
    if @silicon_metal_mix_bag.update(silicon_metal_mix_bag_params)
      redirect_to @silicon_metal_mix_bag, notice: 'Mix bag was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /silicon_metal/mix_bags/1
  def destroy
    @silicon_metal_mix_bag.destroy
    redirect_to silicon_metal_mix_bags_url, notice: 'Mix bag was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_silicon_metal_mix_bag
    @silicon_metal_mix_bag = SiliconMetal::MixBag.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def silicon_metal_mix_bag_params
    params.require(:silicon_metal_mix_bag).permit(
      :date, 
      :bag_no, 
      :operator, 
      :remark, 
      mix_bag_contents_attributes: [
        :id,
        :mix_bag_id, 
        :old_bag_no, 
        :weight, 
        :operator
      ]
    )
  end
    
end
