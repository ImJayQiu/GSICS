class ItReservationsController < ApplicationController
  # GET /it_reservations
  # GET /it_reservations.xml
  def index
    @it_reservations = ItReservation.paginate :page => params[:page], :order => 'created_at DESC, date ',:per_page => 30

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @it_reservations }
    end
  end

  # GET /it_reservations/1
  # GET /it_reservations/1.xml
  def show
    @it_reservation = ItReservation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @it_reservation }
    end
  end

  # GET /it_reservations/new
  # GET /it_reservations/new.xml
  def new
    @it_reservation = ItReservation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @it_reservation }
    end
  end

  # GET /it_reservations/1/edit
  def edit
    @it_reservation = ItReservation.find(params[:id])
  end

  # POST /it_reservations
  # POST /it_reservations.xml
  def create
    params.permit!
    @it_reservation = ItReservation.new(params[:it_reservation])

    respond_to do |format|
      if @it_reservation.save
        format.html { redirect_to(@it_reservation, :notice => 'IT Device Reservation Was Successfully Created !') }
        format.xml  { render :xml => @it_reservation, :status => :created, :location => @it_reservation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @it_reservation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /it_reservations/1
  # PUT /it_reservations/1.xml
  def update
    params.permit!
    @it_reservation = ItReservation.find(params[:id])

    respond_to do |format|
      if @it_reservation.update_attributes(params[:it_reservation])
        format.html { redirect_to(@it_reservation, :notice => 'IT Reservation Was Successfully Updated !') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @it_reservation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /it_reservations/1
  # DELETE /it_reservations/1.xml
  def destroy
    @it_reservation = ItReservation.find(params[:id])
    @it_reservation.destroy

    respond_to do |format|
      format.html { redirect_to(it_reservations_url) }
      format.xml  { head :ok }
    end
  end
end
