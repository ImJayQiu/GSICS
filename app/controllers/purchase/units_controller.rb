# coding: utf-8
class Purchase::UnitsController < ApplicationController
  before_action :set_purchase_unit, only: [:show, :edit, :update, :destroy]

  # GET /purchase/units
  def index
    @purchase_units = Purchase::Unit.all
  end

  # GET /purchase/units/1
  def show
  end

  # GET /purchase/units/new
  def new
    @purchase_unit = Purchase::Unit.new
  end

  # GET /purchase/units/1/edit
  def edit
  end

  # POST /purchase/units
  def create
    @purchase_unit = Purchase::Unit.new(purchase_unit_params)

    if @purchase_unit.save
      redirect_to @purchase_unit, notice: 'Unit was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /purchase/units/1
  def update
    if @purchase_unit.update(purchase_unit_params)
      redirect_to @purchase_unit, notice: 'Unit was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /purchase/units/1
  def destroy
    @purchase_unit.destroy
    redirect_to purchase_units_url, notice: 'Unit was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_purchase_unit
    @purchase_unit = Purchase::Unit.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def purchase_unit_params
    params.require(:purchase_unit).permit(:code, :unit, :remark)
  end
end
