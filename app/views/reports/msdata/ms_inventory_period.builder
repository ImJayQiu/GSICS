xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( 
  :xaxisname=>"Micaosilica Spec-Packing Size", 
  :yaxisname=>"Weight", :hovercapbg=>"DEDEBE", 
  :hovercapborder=>"889E6D", 
  :rotateNames=>"0", 
  :yAxisMaxValue=>"0", 
  :numdivlines=>"9", 
  :divLineColor=>"CCCCCC", 
  :divLineAlpha=>"80", 
  :decimalPrecision=>"2", 
  :formatNumberScale=>"0",
  :showAlternateHGridColor=>"1", 
  :AlternateHGridAlpha=>"30", 
  :AlternateHGridColor=>"CCCCCC", 
  :caption=>"Micaosilica Production - Shipping Information ", 
  :subcaption=>"From: #{@start_date}  To: #{@end_date}", 
  :numberSuffix=>"MT"
)do
        
  #所选区域内生产的微硅粉的规格
  xml.categories( :font=>"Arial", :fontSize=>"11", :fontColor=>"000000" )do 
    Microsilica.all.group_by { |p|p.bsize}.sort.each do |bsize, ms|
      ms.group_by { |p|p.m_type}.sort.each do |spec, p| 
        xml.category( :name=>"#{spec rescue nil}-#{bsize rescue nil}Kg" )
      end 
    end
  end
  
  
  
  
    
  #所选时间区域内尚未被仓库确认的微硅粉的生产量-按照规格排序 
  xml.dataset( :seriesname=>"Non-Confirme Production", :color=>"ff0000")do
    @microsilica_all.group_by { |p|p.bsize}.sort.each do |bsize, ms|
      ms.group_by { |p|p.m_type}.sort.each do |spec, p| 
        @nc_weight = @ms_unconfirm.where(:bsize=>bsize, :m_type=>spec)
        xml.set( :value=>"#{@nc_weight.sum(:bsize).to_f / 1000.0 rescue nil}")     
      end
    end
  end
  
  
  
  
  #所选时间区域内已经被仓库确认的微硅粉的生产量-按照规格排序
  xml.dataset( :seriesname=>"Confirmed Production", :color=>"00ff00")do
    @microsilica_all.group_by { |p|p.bsize}.sort.each do |bsize, ms|
      ms.group_by { |p|p.m_type}.sort.each do |spec, p| 
        @p_weight = @ms_confirmed.where(:bsize=>bsize, :m_type=>spec)
        xml.set( :value=>"#{@p_weight.sum(:bsize).to_f / 1000.0 rescue nil}")     
      end
    end
  end
  
  
  
  
  #所选区域内微硅粉的发货量， 按照规格排序
  xml.dataset( :seriesname=>"Shipping", :color=>"0000ff")do
    @microsilica_all.group_by { |p|p.bsize}.sort.each do |bsize, ms|
      ms.group_by { |p|p.m_type}.sort.each do |spec, p|
        @msshipped = Msshipbag.joins( :msshiplot => :ms_shippment ).where('ms_shippments.date >= ? and ms_shippments.date <= ?', @start_date, @end_date )
        @s_weight = @msshipped.where('msshiplots.spec = ? and msshiplots.bsize = ?', spec, bsize)
        xml.set(:value=>"#{@s_weight.sum("msshiplots.bsize").to_f / 1000 rescue nil}") 
      end
    end
  end
  
  
  
  
end # eng of chart
      

