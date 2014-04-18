xml = Builder::XmlMarkup.new(:indent=>0)

xml.graph( 
  :caption=>"Microsilica Warehouse Checking Status",
  :subcaption=>"", 
  :showNames=>"0", 
  :showValue=>"1",
  :decimalPrecision=>"2",
  :numberSuffix=>" MT",
  :formatNumberScale=>'0'
)do
  
  #@checked = @silo_ms_checked.group_by{ |f|f.m_type  }
  @microsilica_all.group_by {|p|p.silo}.sort.each do |silo, ms|
    ms.group_by { |p|p.m_type}.sort.each do |m_type, ms|
      ms.group_by { |p|p.bsize}.sort.each do |bsize, ms|
        @c_weight_silo = @ms_confirmed.where(:bsize=>bsize, :m_type=>m_type, :silo=>silo)
        xml.set( :name=>"Silo-#{silo} Confirmed &#10; #{m_type}-#{bsize} &#10; #{ms.count} Bags", :value=>"#{@c_weight_silo.sum(:bsize).to_f / 1000.0 rescue nil}")
      end
    end
  end
  
  
  #unconfirm weight
  @microsilica_all.group_by {|p|p.silo}.sort.each do |silo, ms|
    ms.group_by { |p|p.m_type}.sort.each do |m_type, ms|
      ms.group_by { |p|p.bsize}.sort.each do |bsize, ms|
        @nc_weight_silo = @ms_unconfirm.where(:bsize=>bsize, :m_type=>m_type, :silo=>silo)
        xml.set(:name=>"Silo-#{silo} Confirmed &#10; #{m_type}-#{bsize} &#10; #{ms.count} Bags", :value=>"#{@nc_weight_silo.sum(:bsize).to_f / 1000.0 rescue nil}")     
      end
    end
  end
  
  
     
  #  #所选时间区域内尚未被仓库确认的微硅粉的生产量-按照规格排序 
  #  
  #  @microsilica_all.group_by { |p|p.bsize}.sort.each do |bsize, ms|
  #    ms.group_by {|p|p.silo}.sort.each do |silo, ms|
  #      ms.group_by { |p|p.m_type}.sort.each do |spec, p| 
  #        @nc_weight = @ms_unconfirm.where(:bsize=>bsize, :m_type=>spec)
  #        xml.set( :name=>"Silo-#{silo} Non-Confirmed #{spec}-#{bsize} #{p.count} Bags", :value=>"#{@nc_weight.sum(:bsize).to_f / 1000.0 rescue nil}")     
  #      end
  #    end
  #  end
  # 
  #  
  #  
  #  
  #  
  #  #所选时间区域内已经被仓库确认的微硅粉的生产量-按照规格排序
  #
  #  @microsilica_all.group_by { |p|p.bsize}.sort.each do |bsize, ms|
  #    ms.group_by {|p|p.silo}.sort.each do |silo, ms|
  #      ms.group_by { |p|p.m_type}.sort.each do |spec, p| 
  #        @p_weight = @ms_confirmed.where(:bsize=>bsize, :m_type=>spec)
  #        xml.set(:name=>"Silo-#{silo} Confirmed #{spec}-#{bsize} #{p.count} Bags", :value=>"#{@p_weight.sum(:bsize).to_f / 1000.0 rescue nil}")     
  #      end
  #    end
  #  end
  #  
  
end

