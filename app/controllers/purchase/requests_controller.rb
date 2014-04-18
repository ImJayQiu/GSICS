# coding: utf-8
class Purchase::RequestsController < ApplicationController
  # GET /purchase/requests
  # GET /purchase/requests.xml
  
  layout 'main', :except =>[:confirming, 
    :wh_rejecting,
    :p_confirming, 
    :planning, 
    :rejecting, 
    :finishing, 
    :warehousing,
    :noting,
    :all,
    :canceling
  ]
  
  
  def index # create purchase request and show those which not yet confirmed.
     
    if can? :confirm , :purchase or can? :plan , :purchase
    
      @purchase_requests = Purchase::Request.where(
      
        "(confirm IS null OR confirm = ?) AND (wh_reject_note IS null OR wh_reject_note = ?) ", "", ""
      
      ).paginate :page => params[:page], 
        :order => 'deadline, created_at DESC', 
        :per_page => 50
    
    else
      @purchase_requests = Purchase::Request.where(
      
        "(confirm IS null OR confirm = ?) AND name = ?", "", current_user.username
      
      ).paginate :page => params[:page], 
        :order => 'deadline, created_at DESC', 
        :per_page => 50
    end rescue nil

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @purchase_requests }
    end

  end
  
  def p_confirm
    @purchase_requests = Purchase::Request.where(
    
      "confirm <> '' 
        AND (p_confirm IS null OR p_confirm = ?) 
        AND (p_date IS null OR p_date = ?)", "", "" 
    
    ).paginate :page => params[:page], 
      :order => 'deadline, created_at DESC', 
      :per_page => 50
             
    @purchase_locations = @purchase_requests.group_by {|p|p.location}
    
  end
  
  def plan # show those which confirmed  
   
    @purchase_requests = Purchase::Request.where(
      
      "confirm <> '' 
        AND p_confirm<>'' 
        AND (p_date IS null OR p_date = ?)", ""
      
    ).paginate :page => params[:page], 
      :order => 'deadline, created_at DESC', 
      :per_page => 50
  
    @purchase_locations = @purchase_requests.group_by {|p|p.location}
    
  end
  
  def finish # show those which confirmed  
    
    @purchase_requests = Purchase::Request.where(
      
      "confirm <> '' 
        AND p_confirm<>'' 
        AND p_date <> '' 
        AND (a_date IS null
          OR a_qty IS null 
          OR a_price IS null)"
      
    ).paginate :page => params[:page], 
      :order => 'deadline, created_at DESC', 
      :per_page => 50
  
    @purchase_plans = @purchase_requests.group_by {|p|p.p_date}
    
  end
  
  def warehouse # show those which waiting for warehouse confirm  
   
    @purchase_requests = Purchase::Request.where( 
      
      " confirm<>'' 
          AND p_confirm<>'' 
          AND p_date<>'' 
          AND a_date<>'' 
          AND (a_qty<>'' OR a_qty=0 ) 
          AND (a_price<>'' OR a_price=0 )
          AND (wh_date IS null or wh_date='') 
          AND (wh_location IS null or wh_location='') "  
      
    ).paginate :page => params[:page], 
      :order => 'a_date DESC, deadline, created_at DESC', 
      :per_page => 50
  
  end

  def warehoused # show those which warehouse confirmed  
   
    @warehoused = Purchase::Request.where( 
      
      " confirm<>'' 
          AND p_confirm<>''
          AND p_date<>''
          AND a_date<>''
          AND a_qty<>''
          AND a_price<>''
          AND wh_date <>''
          AND wh_location<>''
          AND wh_confirm<>''
          AND wh_submit_date<>'' "
      
    ).paginate :page => params[:page], 
      :order => 'deadline, created_at DESC', 
      :per_page => 50
  
  end
  
  
  # GET /purchase/requests/1
  # GET /purchase/requests/1.xml
  def show
    @purchase_request = Purchase::Request.find(params[:id])
    @duration=(@purchase_request.deadline-Date.today-1).to_i
    
    if @duration < 0
      @purchase_priority="超 期 采 购 | Delay!" and @color="#ff0000"
    elsif @duration < 3
      @purchase_priority="紧 急 采 购 | Urgent" and @color="#ffcc00"
    else
      @purchase_priority="正 常 采 购 | Normal" and @color="#ffffff"
    end # end if @duration < 0
    
    @r_count = Purchase::Request.where("date=? AND id<?", Date.today, @purchase_request.id).count
    
    if @purchase_request.code.present?
      
      @code = @purchase_request.code
      
    else
      
      if @r_count < 1
        @code = "GS-P-#{Date.today.strftime('%y%m%d')}-001"
      else
        @code = "GS-P-#{Date.today.strftime('%y%m%d')}-"+(@r_count+1).to_s.rjust(3,'0')
      end # end if @r_count<1
    
    end #end if @purchase_request.code.present
    
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @purchase_request }
    end
  end
  
  def detail
    @purchase_request = Purchase::Request.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @purchase_request }
    end
  end

  # GET /purchase/requests/new
  # GET /purchase/requests/new.xml
  def new
    
    @purchase_request = Purchase::Request.new
    @deadline=Date.today+1.month
    @date=Date.today
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @purchase_request }
    end
  end

  # GET /purchase/requests/1/edit
  def edit
    @purchase_request = Purchase::Request.find(params[:id])
    @code = @purchase_request.code
    @date = @purchase_request.date
    @deadline = @purchase_request.deadline
    @reject=''
    @confirm=''
    @wh_reject_note=''
  end

  # POST /purchase/requests
  # POST /purchase/requests.xml
  def create
    params.permit!
    @purchase_request = Purchase::Request.new(params[:purchase_request])

    respond_to do |format|
      if @purchase_request.save
        format.html { redirect_to(@purchase_request, :notice => 'Request was successfully created.') }   
        format.xml  { render :xml => @purchase_request, :status => :created, :location => @purchase_request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @purchase_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  def confirming
    @purchase_request = Purchase::Request.find(params[:id])
    
    @r_count = Purchase::Request.where("date=? AND id<?", @purchase_request.date, @purchase_request.id ).count
    
    if @purchase_request.code.present?
      @code = @purchase_request.code
    else
      
      if @r_count < 1
        @code = "GS-P-#{@purchase_request.date.strftime('%y%m%d')}-001"
      else
        @code = "GS-P-#{@purchase_request.date.strftime('%y%m%d')}-"+(@r_count+1).to_s.rjust(3,'0')
      end # end if @r_count<1
    
    end #end if @purchase_request.code.present
    
  end
  
  def p_confirming
    @purchase_request = Purchase::Request.find(params[:id])
  end
  
  def canceling
    @purchase_request = Purchase::Request.find(params[:id])
    @r_count = Purchase::Request.where("date=? AND id<?", @purchase_request.date, @purchase_request.id ).count
    
    if @purchase_request.code.present?
      @code = @purchase_request.code
    else
      
      if @r_count < 1
        @code = "GS-P-#{@purchase_request.date.strftime('%y%m%d')}-001"
      else
        @code = "GS-P-#{@purchase_request.date.strftime('%y%m%d')}-"+(@r_count+1).to_s.rjust(3,'0')
      end # end if @r_count<1
    
    end #end if @purchase_request.code.present
  end
  
  
  def rejecting
    @purchase_request = Purchase::Request.find(params[:id])
  end
  
  def planning
    @purchase_request = Purchase::Request.find(params[:id])
  end
  
  def finishing
    @purchase_request = Purchase::Request.find(params[:id])
  end
  
  def warehousing
    @purchase_request = Purchase::Request.find(params[:id])
  end
  
  def wh_rejecting
    @purchase_request = Purchase::Request.find(params[:id])
  
    @r_count = Purchase::Request.where("date=? AND id<?", @purchase_request.date, @purchase_request.id ).count
    
    if @purchase_request.code.present?
      @code = @purchase_request.code
    else
      
      if @r_count < 1
        @code = "GS-P-#{@purchase_request.date.strftime('%y%m%d')}-001"
      else
        @code = "GS-P-#{@purchase_request.date.strftime('%y%m%d')}-"+(@r_count+1).to_s.rjust(3,'0')
      end # end if @r_count<1
    
    end #end if @purchase_request.code.present
  
  end
  
  def noting
    
    @purchase_request = Purchase::Request.find(params[:id])
    
    
  end
  
  # PUT /purchase/requests/1
  # PUT /purchase/requests/1.xml
  
  def update
    params.permit!
    @purchase_request = Purchase::Request.find(params[:id])

    respond_to do |format|
      
      if @purchase_request.update_attributes(params[:purchase_request])

        format.html { redirect_to(@purchase_request, :notice => 'Request Was Successfully Update !' ) } 
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @purchase_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  
  # DELETE /purchase/requests/1
  # DELETE /purchase/requests/1.xml
  def destroy
    @purchase_request = Purchase::Request.find(params[:id])
    @purchase_request.destroy

    respond_to do |format|
      format.html { redirect_to(purchase_requests_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def trace
    
    #@date = params[:purchase_submit_date].to_date
    @name = current_user.username
    @purchase_requests = Purchase::Request.where(
    
      #"DATE(created_at) = ?", @date
      :name=>@name
    
    ).paginate :page => params[:page], 
      :order => 'deadline DESC, created_at DESC', 
      :per_page => 50

  end
  
  def summary
    
  end
  
  def all
    @purchase = Purchase::Request.where( "a_date IS null OR a_date = ?", "").order( 'created_at, deadline DESC, p_confirm_date DESC')
  end
  
  
end # end of controller
