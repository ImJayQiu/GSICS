class SiliconMetal::MixBagContentsController < ApplicationController
  before_action :set_silicon_metal_mix_bag_content, only: [:show, :edit, :update, :destroy]

  # GET /silicon_metal/mix_bag_contents
  def index
    @silicon_metal_mix_bag_contents = SiliconMetal::MixBagContent.all
  end

  # GET /silicon_metal/mix_bag_contents/1
  def show
  end

  # GET /silicon_metal/mix_bag_contents/new
  def new
    @silicon_metal_mix_bag_content = SiliconMetal::MixBagContent.new
  end

  # GET /silicon_metal/mix_bag_contents/1/edit
  def edit
  end

  # POST /silicon_metal/mix_bag_contents
  def create
    @silicon_metal_mix_bag_content = SiliconMetal::MixBagContent.new(silicon_metal_mix_bag_content_params)

    if @silicon_metal_mix_bag_content.save
      redirect_to @silicon_metal_mix_bag_content, notice: 'Mix bag content was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /silicon_metal/mix_bag_contents/1
  def update
    if @silicon_metal_mix_bag_content.update(silicon_metal_mix_bag_content_params)
      redirect_to @silicon_metal_mix_bag_content, notice: 'Mix bag content was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /silicon_metal/mix_bag_contents/1
  def destroy
    @silicon_metal_mix_bag_content.destroy
    redirect_to silicon_metal_mix_bag_contents_url, notice: 'Mix bag content was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_silicon_metal_mix_bag_content
      @silicon_metal_mix_bag_content = SiliconMetal::MixBagContent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def silicon_metal_mix_bag_content_params
      params.require(:silicon_metal_mix_bag_content).permit(:mix_bag_id, :old_bag_no, :weight, :operator)
    end
end
