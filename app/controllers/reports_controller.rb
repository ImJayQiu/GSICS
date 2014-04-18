#coding = utf-8

class ReportsController < ApplicationController
  
  
  layout "main", :except => :print
  
  def daily
 
    
    @quartz_rate=RmRate.where(:code=>"quartz").first.rate.to_i
    @charcoal_rate=RmRate.where(:code=>"charcoal").first.rate.to_i
    @wood_rate=RmRate.where(:code=>"wood").first.rate.to_i
    @coke_rate=RmRate.where(:code=>"coke").first.rate.to_i
    
    # 生成生產日報表
    
    if params[:date]
      date = params[:date].to_date
      #sdate = Date.civil(params[:date][:"(1i)"].to_i,params[:date][:"(2i)"].to_i,params[:date][:"(3i)"].to_i)
      @silicons = Silicon.select("id, fe, al, ca, ti, p, b, furnace, grade, weight, shift, no, date, remark, t_point").where("date=?", date).order( 'furnace, date DESC, shift, no')
      @silicons_yesterday = Silicon.where("date=?", date.yesterday).order( 'furnace, date DESC, shift, no')
    end
    
    @date_select = date
    
    @expense = EFurnace.where("date=?", @date_select)
    
    @total_power=@expense.sum(:s1_e)+@expense.sum(:s2_e)+@expense.sum(:s3_e)
    @total_quartz=@expense.sum(:s1_q)+@expense.sum(:s2_q)+@expense.sum(:s3_q)
    @total_charcoal=@expense.sum(:s1_ch)+@expense.sum(:s2_ch)+@expense.sum(:s3_ch)
    @total_wood=@expense.sum(:s1_w)+@expense.sum(:s2_w)+@expense.sum(:s3_w)
    @total_coke=@expense.sum(:s1_c)+@expense.sum(:s2_c)+@expense.sum(:s3_c)
    
    @furnace = @silicons.group_by { |s|s.furnace }
    @furnace_yesterday = @silicons_yesterday.group_by { |s|s.furnace }
    
    @si_packing = SiInventoryContent.where(:p_date=>@date_select)
    
  end
  
  
  def period
    
    @grades = Grade.all
    # 某時間區間內的生產報表
  
    #############判断时间区间############################
    if params[:start_date] && params[:end_date]   
      
      @start_date = params[:start_date].to_date
      @end_date = params[:end_date].to_date
      
      @date_period = @start_date..@end_date
      
    end
    
    # Packing info at this period
    @si_packing_period = SiInventoryContent.where(:p_date=>@date_period)
    
    
     
    #判断等级
    if params[:grade]==""
      @grade=[]
      @grades.each do |g|
        @grade << g.name
      end
      @grade_type = "所 有 等 级 | All Grade"
    else      
      @grade = params[:grade]
      @grade_type = @grade  
    end
    
    ################判断铁，铝，钙含量###################
       
    #    @fe = sprintf("%0.3f ", params[:fe].to_f*10000).to_s
    #    @al = sprintf("%0.3f ", params[:al].to_f*10000).to_s
    if params[:fe]==""
      @fe = (0...1000000)
    else
      @fe = (0...params[:fe].to_f*10000)
    end
    
    if params[:al]==""
      @al = (0...1000000)
    else
      @al = (0...params[:al].to_f*10000)
    end
    
    if params[:ca]==""
      @ca = (0...1000000)
    else
      @ca = (0...params[:ca].to_f*10000)
    end
    
    ##################参数检索###################
    @silicons=Silicon.select("id, fe, al, ca, ti, furnace, grade, weight, shift, no, date, remark, operator, sampler").where(:date=>@date_period, :grade => @grade, :fe=>@fe, :al=>@al, :ca=>@ca ).order( 'furnace, date DESC, shift DESC, no DESC')
    #@silicons=Silicon.where("").order( 'furnace, date DESC, shift, no')
    #@silicons=Silicon.find_by_sql(["SELECT * FROM silicons WHERE date BETWEEN ? AND ? " , @start_date, @end_date])
    @furnace = @silicons.group_by { |a|a.furnace}
    @date = @silicons.group_by { |a|a.date }.sort
    @silicon_date_monthly = @silicons.group_by { |s|s.date.strftime("%Y-%m") }
  
    
    @expense = EFurnace.where(:date=>@date_period).order('date')
    @expense_date = @expense.group_by { |e|e.date  }
    
    
    
  end
  
  
  def search
    
    # 金屬硅檢索
    
    #    if params[:fur] && params[:date]&& params[:shift]&& params[:no]
    #          
    #      furnace = params[:fur]
    #      date = Date.civil(params[:date][:"(1i)"].to_i,params[:date][:"(2i)"].to_i,params[:date][:"(3i)"].to_i)
    #      shift = params[:shift]
    #      no = params[:no]
    #          
    #      @silicon = Silicon.where( :date=>date, :furnace=>furnace, :shift=>shift, :no=>no)
    #    
    #    end
  end
  
  def search_result ## Search from QC
    
    if params[:sicodes] && params[:weight]
      
      @weight = params[:weight][0]

      @sicodes = params[:sicodes][0].split(/\r\n/) #[0] means select the first element from this array.
      
      @silicons = []
      @pack_bag_ids_all = []
      
      
      @sicodes.each do |sc|        
       
        @silicon = Silicon.where( "date=? && furnace=? && shift=? && no=? ","20"+sc[5,2]+"-"+sc[7,2]+"-"+sc[9,2],sc[3,1], sc[12,1], sc[14,1])            
        @silicons << @silicon  

        @si_packing = SiInventoryContent.select('si_inventory_id').where(p_date: "20"+sc[5,2]+"-"+sc[7,2]+"-"+sc[9,2], furnace: sc[3,1], shift: sc[12,1], no: sc[14,1] )
        @pack_bag_ids=[]
        @si_packing.each do |si|
          @pack_bag_ids << si.si_inventory_id
        end
        @pack_bag_ids_all<<@pack_bag_ids
      end            
      
    end
    
  end
  
  
  
  
  def search_result_wh ## Search from warehouse 
    
    if (params[:wh_date] && params[:p_date] && params[:location] && params[:gpo_code] && params[:container_no] && params[:sicodes]) == ["*"]
      @silicon_bags = [""]
      @silicon_feedback = "Please identify at least one condition. | 请先定义一个检索条件"
    else
      if params[:wh_date] && params[:p_date] && params[:location] && params[:gpo_code] && params[:container_no] && params[:sicodes]
      
        @sicodes = params[:sicodes][0].split(/\r\n/) #[0] means select the first element from this array.
        @wh_date = params[:wh_date]
        @p_date = params[:p_date]
        @location = params[:location]
        @gpo_code = params[:gpo_code]
        @container_no = params[:container_no]
      
        ############# Start to check condition p_date ###########
        if @p_date == [""]
          @si_wh_p = SiInventory.where("date IS NULL OR date = ?", "")
        elsif @wh_date == ["*"]
          @si_wh_p = SiInventory.all
        else
          @si_wh_p = SiInventory.where("date = ?", @p_date)
          # end # end of if=="*"d
        end # end of if.nil?
        ########### Finish p_date checking  ####################
    
        
        ############# Start to check condition wh_date ###########
        if @wh_date == [""]
          @si_wh_d = @si_wh_p.where("wh_date IS NULL OR wh_date = ?", "")
        elsif @wh_date == ["*"]
          @si_wh_d = SiInventory.all
        else
          @si_wh_d = @si_wh_p.where("wh_date = ?", @wh_date)
          # end # end of if=="*"d
        end # end of if.nil?
        ########### Finish wh_date checking  ####################
    
        ########### Start to check condition location ###########
        if @location == [""]
          @si_wh_dl = @si_wh_d.where("location IS null OR location = ?", "")
        else
          if @location == ["*"]
            @si_wh_dl = @si_wh_d
          else
            @si_wh_dl = @si_wh_d.where("location = ?", @location)
          end # end of if=="*"d
        end # end of if.nil?
        ########### Finish location checking  ####################
    
        ########### Start to check condition gpo_code ###########
        if @gpo_code == [""]
          @si_wh_dlg = @si_wh_dl.where("gpo_code IS null OR gpo_code = ?", "")
        else
          if @gpo_code == ["*"]
            @si_wh_dlg = @si_wh_dl
          else
            @si_wh_dlg = @si_wh_dl.where("gpo_code = ? OR gpo_production = ?", @gpo_code, @gpo_code )
          end # end of if=="*"d
        end # end of if.nil?
        ########### Finish gpo_code checking  ####################
    
        ########### Start to check condition container_no ###########
        if @container_no == [""]
          @si_wh_dlgc = @si_wh_dlg.where("container_no IS null OR container_no = ?", "")
        else
          if @container_no == ["*"]
            @si_wh_dlgc = @si_wh_dlg
          else
            @si_wh_dlgc = @si_wh_dlg.where("container_no = ?", @container_no)
          end # end of if=="*"d
        end # end of if.nil?
        ########### Finish container_no checking  ####################
    
        ########### Start to check condition silicon bag no. ####### 
      
      
        if params[:sicodes] == [""]
          @silicon_bags = @si_wh_dlgc
        else
        
          @silicon_bags = [] rescue nil
          @silicon_bags_mix= [] rescue nil
        
          @sicodes.each do |sc|  # sc[5,2] star from 5th element not inclued, select 2 elements after that.  

            if sc.size > 10
              silicon_bag = @si_wh_dlgc.where("date=? && furnace=? && shift=? && no=? && bag=? ","20"+sc[5,2]+"-"+sc[7,2]+"-"+sc[9,2],sc[3,1], sc[12,1], sc[14,1], sc[16,3] ).first 
              
              if silicon_bag.nil?
                silicon_bag_mix = SiliconMetal::MixBag.where("bag_no=?", sc).includes(:mix_bag_contents).first
              end
              
            else
              silicon_bag = @si_wh_dlgc.where( "bag_no=?", sc[0,4]+sc[5,5] ).first              
            end
        
            @silicon_bags << silicon_bag unless silicon_bag.nil?    
            @silicon_bags_mix << silicon_bag_mix unless silicon_bag_mix.nil?
          end # end of @sicodes.each 
        end # end if params[:sicodes].nil? 
      
      end # if params
      
    end # if everything ==[""]["*"]
  
  end # end of def
  
  
  
  
  def charcoalsum
    
    # 建立破碎統計表
    # 
  
    if params[:crash_sum_form]
      @charcoals = Charcoal.where("crash_sum_form=?", params[:crash_sum_form] )
    end
    
    @charcoalsum = @charcoals.group_by { |c|c.crash_sum_form  }
    @supplier = @charcoals.group_by { |c|c.su_code  }
    
  end
  
  ################################ Microsilica Report ###########################
  
  def ms_report
    
    @grades = Grade.where(:product=>"microsilica")
    @normal = " 无异常 | Normal | ปกติ "
    
    # 某時間區間內的生產報表
  
    ############# 判 断 时 间 区 间 ############################
    if params[:ms_sdate] && params[:ms_edate]   
      
      @start_date = params[:ms_sdate].to_date
      @end_date = params[:ms_edate].to_date
    
      @date_period = @start_date..@end_date
      
    end
    
    if params[:p_spec] == ""
      @p_spec = []
      @grades.each do |g|
        @p_spec << g.name
      end
    else
      @p_spec = params[:p_spec]
    end
      
    if params[:size] == ""
      @size = (1...10000)
    else
      @size = params[:size]
    end
     
    #判断等级
    if params[:silo]==""
      @silo = (0...100)
      @silo_name = "所 有 加 密 仓 | All Silos"
    else 
      @silo = params[:silo]
      @silo_name = "SILO-" + @silo
    end
    
    ################ 判 断 密 度 ###################     
      
    if params[:low_density]==""
      @low_density = "0".to_f
    else
      @low_density = params[:low_density].to_f
    end
    
    if params[:high_density]==""
      @high_density = "10000".to_f
    else
      @high_density = params[:high_density].to_f
    end
    
    @density_period = @low_density..@high_density
    

    ##################参数检索###################
    @microsilica_all = Microsilica.all
    
    @production_confirmed = MsProdConfirm.where(:date=>@date_period)
    @date_confirmed = @production_confirmed.collect(&:date)
    
    
    #根据条件所检索出的微硅粉生产记录
    @microsilicas = Microsilica.where(:date=>@date_confirmed, :silo => @silo, :density=>@density_period, :bsize=>@size, :m_type=>@p_spec ).order( 'silo, date DESC, bag DESC, m_type')
    @ms_unconfirm = @microsilicas.where( "location IS NULL OR location = ' ' "  )
    @ms_confirmed = @microsilicas.where( "location != ' ' " )
    #unconfirm Microsilica
    # @ms_uc = @microsilicas.where("location=?", nil)
    
    #confirmed Microsilica
    #@ms_c = @microsilica.where("location=?", "*" )
    
    
    
    @ms_shippments = MsShippment.where(:date=>@date_period)
    #所选择时间范围内微硅粉发货记录
    @msshipped_all = Msshipbag.joins( :msshiplot => :ms_shippment )
    @msshipped = Msshipbag.joins( :msshiplot => :ms_shippment ).where('ms_shippments.date >= ? and ms_shippments.date <= ?', @start_date, @end_date )
    
    @msshipped_po = @msshipped.group_by { |s|s.msshiplot.ms_shippment.po }.sort
   
    @msshipped_spec = @msshipped.group_by { |s|s.msshiplot.spec }.sort
    
    @silo_ms = @microsilicas.group_by { |m|m.silo}
    @silo_ms_checked = @microsilicas.where( "location != ' ' " ).group_by { |m|m.silo}
    @silo_ms_uncheck = @microsilicas.where( "location IS NULL OR location = ' ' "  ).group_by { |m|m.silo}
    
    @date = @microsilicas.group_by { |m|m.date }.sort{ |a, b| a <=> b  }
    
  end # end of ms_report

  #微硅粉库存统计
  def ms_inventory
    
    #库存期间
    @year = params["date"]["year"]
    @year_short = "#{@year}-01-01".to_date.strftime("%y")
    
    @ms_loss = MsLoss.where(:e_date=>"#{@year}-01-01".to_date.."#{@year}-12-31".to_date).sum(:qty)

    @microsilicas = Microsilica.all
    @msshiplots = Msshiplot.all
    @msshipbags = Msshipbag.all
    
    #所有产品的产量
    @all_production = Microsilica.sum(:bsize) 
    
    #所选年份的产量
    @microsilicas_selected_year = Microsilica.where("date >= ? and date <= ?", "#{@year}-01-01", "#{@year}-12-31") #所选年度生产的所有微硅粉
    
    
    #所选年份 - 确认后产量
    @microsilicas_selected_year_confirmed = Microsilica.where("date >= ? and date <= ? and location != ? ", "#{@year}-01-01", "#{@year}-12-31", "" ) #所选年度生产的所有微硅粉
    
    
    #所选年度的生产总量
    @production = @microsilicas_selected_year.sum(:bsize) 
    
    #所选年度经过确认的生产总量
    @production_confirmed = @microsilicas_selected_year_confirmed.sum(:bsize) 
    
    #已经发货的所有微硅粉
    @all_shipped_bags = Msshipbag.includes( :msshiplot=>:ms_shippment ).find(:all) 
    
    #所选年度发货的所有微硅粉
    @shipped_bags = Msshipbag.joins( :msshiplot=>:ms_shippment ).where("ms_shippments.date >= ? and ms_shippments.date <= ?", "#{@year}-01-01", "#{@year}-12-31")

    #所选年度发货的该年度生产的微硅粉
    @shipped_bags_selected_year = Msshipbag.joins( :msshiplot=>:ms_shippment ).where("msshiplots.lyear = ? ", @year_short)

    
    @shipped_bags_year = @shipped_bags.group_by { |s|s.msshiplot.lyear }.sort
    @shipped_bags_silo = @shipped_bags.group_by { |s|s.msshiplot.lsilo }.sort
    @shipped_bags_bsize = @shipped_bags.group_by { |s|s.msshiplot.bsize}.sort
    @shipped_bags_spec = @shipped_bags.group_by { |s|s.msshiplot.spec}.sort
    
    #基于所选择的年份，已经发出的所有产品的总重量
    @shipped_weight_selectd = [] 
    @shipped_bags.each do |bag|
      @shipped_weight_selectd << bag.msshiplot.bsize.to_i  
    end
    
    #全部发货总重量
    #    @shipped_weight_all = [] 
    #    @all_shipped_bags.each do |bag|
    #      @shipped_weight_all << bag.msshiplot.bsize.to_i  
    #    end
    
    #基于所选择的年份，已经发出的该年度生产的产品的总重量
    @shipped_weight_selectd_year = [] 
    @shipped_bags_selected_year.each do |bag|
      @shipped_weight_selectd_year << bag.msshiplot.bsize.to_i  
    end
    @shipped_weight_selectd_year_sum = @shipped_weight_selectd_year.sum
    
    
  end # end of ms_inventory
  
  
  
  #charcoal supplier analysis report
  def supplier_analysis
    
    
    if params[:charcoal_sdate] && params[:charcoal_edate]   
      
      @start_date = params[:charcoal_sdate].to_date
      @end_date = params[:charcoal_edate].to_date
    
      @date_period = @start_date..@end_date
      
    end
    
    if params[:su_code]
      @su_code = params[:su_code]
    end
    
    @selected_supplier = Supplier.where("code=?", @su_code)
    
    @charcoal_period = Charcoal.where(:date=>@date_period )
    
    @supplier_period = @charcoal_period.where("su_code=?", @su_code)
    
    ################# Select Supplier Test Result ########################################### 
    
    if @supplier_period.average(:t1).nil?
      @t1color = "#FF0000"
    elsif @supplier_period.average(:t1).round(2) < 7.00
      @t1color = "#00FF00" 
    else
      @t1color = "#FF0000" 
    end
    
    if @supplier_period.average(:t2).nil?
      @t2color = "#FF0000"
    elsif @supplier_period.average(:t2).round(2) < 3.00
      @t2color = "#00FF00" 
    else
      @t2color = "#FF0000" 
    end
    
   
    if @supplier_period.average(:t4).nil?
      @t4color = "#FF0000"
    elsif @supplier_period.average(:t4).round(2) > 70.00
      @t4color = "#00FF00" 
    else
      @t4color = "#FF0000" 
    end
    ############################# End #################################### 
    
    ############################ All Suppliers' Test Result ########################################
    
    if @charcoal_period.average(:t1).nil?
      @tt1color = "#FF0000"
    elsif @charcoal_period.average(:t1).round(2) < 7.00
      @tt1color = "#00FF00" 
    else
      @tt1color = "#FF0000" 
    end
    
    
    if @charcoal_period.average(:t2).round(2) < 3.00
      @tt2color = "#00FF00" 
    else
      @tt2color = "#FF0000" 
    end
   
    if @charcoal_period.average(:t4).round(2) > 70.00
      @tt4color = "#00FF00" 
    else
      @tt4color = "#FF0000" 
    end  
    
    ################################## End #################################################
    
  end #of charcoal supplier anaysis report
  
  
  
  def hd
    
  end
  
  
  
  def quartzs_search
    
    @quartzs = Quartz.all
    @quartz_color = @quartzs.group_by{|q|q.color}
    @quartz_supplier = @quartzs.group_by{|q|q.supplier}
    
    @color_all = [] 
    @quartz_color.each do |color,c|
      @color_all << color  
    end
    
    @supplier_all = []
    @quartz_supplier.each do |supplier,s|
      @supplier_all << supplier
    end
    
    if params[:color] == ""
      @color = @color_all
    else
      @color = params[:color]
    end
    
    if params[:supplier] == ""
      @supplier = @supplier_all
    else
      @supplier = params[:supplier]
    end
    
    #@quartzs = Quartz.where("color=? AND supplier=?", @color, @supplier)
    
    @quartzs = Quartz.where(:color=>@color,:supplier=>@supplier).paginate :page => params[:page], :order => 'created_at DESC', :per_page => 30
    
    
  end  # end of quartzs search  
  
  
  
  
  
  def search_salary_result  
  
    if params[:salary] && params[:w_days]
      
      @salary = params[:salary][0]
      @w_days = params[:w_days][0].split(/\r\n/)
    
      
    end
  
  end
  
  def silicon_metal_inventory
    @sm_inventory = SiInventory.where("location<>'' AND ( container_no IS null OR container_no = ? )", "")
    @sm_inventory_grade = @sm_inventory.group_by {|sm|sm.grade} 
    @temp=SiInventory.where("date>? AND grade = ? AND weight = ?", "2013-12-31","441","1000")
  end

end