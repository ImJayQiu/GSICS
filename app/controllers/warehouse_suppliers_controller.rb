class WarehouseSuppliersController < ApplicationController
  # GET /warehouse_suppliers
  # GET /warehouse_suppliers.xml
  def index
    @warehouse_suppliers = WarehouseSupplier.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @warehouse_suppliers }
    end
  end

  # GET /warehouse_suppliers/1
  # GET /warehouse_suppliers/1.xml
  def show
    @warehouse_supplier = WarehouseSupplier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @warehouse_supplier }
    end
  end

  # GET /warehouse_suppliers/new
  # GET /warehouse_suppliers/new.xml
  def new
    @warehouse_supplier = WarehouseSupplier.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @warehouse_supplier }
    end
  end

  # GET /warehouse_suppliers/1/edit
  def edit
    @warehouse_supplier = WarehouseSupplier.find(params[:id])
  end

  # POST /warehouse_suppliers
  # POST /warehouse_suppliers.xml
  def create
    params.permit!
    @warehouse_supplier = WarehouseSupplier.new(params[:warehouse_supplier])

    respond_to do |format|
      if @warehouse_supplier.save
        format.html { redirect_to(@warehouse_supplier, :notice => 'Warehouse supplier was successfully created.') }
        format.xml  { render :xml => @warehouse_supplier, :status => :created, :location => @warehouse_supplier }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @warehouse_supplier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /warehouse_suppliers/1
  # PUT /warehouse_suppliers/1.xml
  def update
    params.permit!
    @warehouse_supplier = WarehouseSupplier.find(params[:id])

    respond_to do |format|
      if @warehouse_supplier.update_attributes(params[:warehouse_supplier])
        format.html { redirect_to(@warehouse_supplier, :notice => 'Warehouse supplier was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @warehouse_supplier.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /warehouse_suppliers/1
  # DELETE /warehouse_suppliers/1.xml
  def destroy
    @warehouse_supplier = WarehouseSupplier.find(params[:id])
    @warehouse_supplier.destroy

    respond_to do |format|
      format.html { redirect_to(warehouse_suppliers_url) }
      format.xml  { head :ok }
    end
  end
end
