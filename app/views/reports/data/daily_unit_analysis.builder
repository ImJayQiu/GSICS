xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( 
  :caption=>"Furnaces Performance Analysis",
  :subcaption=>"Unit : MT or Kw / Per MT Silicon Metal ", 
  :showNames=>"1", 
  :decimalPrecision=>"3",
  :numberSuffix=>"", 
  :formatNumberScale=>'1',
  :stack100Percent=>"1", 
  :showPercentValues=>"0"
)do
  
  @f_expense=@expense.group_by {|e|e.furnace}
  @t_weight = @silicons.group_by{ |f|f.furnace }
  
  
  xml.categories() do
    @f_expense.sort.each do |f,expense|
      xml.category(:label=>"Furnace-#{f}")
    end
    xml.category(:label=>"Average")
  end

  xml.dataset(:seriesName=>"Power(Kw)") do
    @t_power=[]
    @f_expense.sort.each do |f,expense|
      @ft_weight=@t_weight[f].collect(&:weight).sum rescue nil
      expense.each do |e|
        @f_power=((e.s1_e + e.s2_e + e.s3_e).to_f/@ft_weight ).round(2) rescue nil
        xml.set( :value=> @f_power )
        @t_power<<@f_power.to_f
      end
    end
    xml.set( :value => "#{(@t_power.sum.to_f/@t_power.count).round(2) rescue nil}" ) 
  end
  
  xml.dataset(:seriesName=>"Quartz(MT)") do
    @t_quartz=[]
    @f_expense.sort.each do |f,expense|
      @ft_weight=@t_weight[f].collect(&:weight).sum rescue nil
      expense.each do |e|
        @f_quartz=((e.s1_q + e.s2_q + e.s3_q).to_f/@ft_weight ).round(2) rescue nil
        xml.set( :value=> @f_quartz )
        @t_quartz<<@f_quartz.to_f
      end
    end
    xml.set( :value => "#{(@t_quartz.sum.to_f/@t_quartz.count).round(2) rescue nil}" ) 
  end
  
  xml.dataset(:seriesName=>"Charcoal(MT)") do
    @t_charcoal=[]
    @f_expense.sort.each do |f,expense|
      @ft_weight=@t_weight[f].collect(&:weight).sum rescue nil
      expense.each do |e|
        @f_charcoal=((e.s1_ch + e.s2_ch + e.s3_ch).to_f/@ft_weight ).round(2) rescue nil
        xml.set( :value=> @f_charcoal )
        @t_charcoal<<@f_charcoal.to_f
      end
    end
    xml.set( :value => "#{(@t_charcoal.sum.to_f/@t_charcoal.count).round(2) rescue nil}" ) 
  end
  
  xml.dataset(:seriesName=>"Coke(MT)") do
    @t_coke=[]
    @f_expense.sort.each do |f,expense|
      @ft_weight=@t_weight[f].collect(&:weight).sum rescue nil
      expense.each do |e|
        @f_coke=((e.s1_c + e.s2_c + e.s3_c).to_f/@ft_weight ).round(2) rescue nil
        xml.set( :value=> @f_coke )
        @t_coke<<@f_coke.to_f
      end
    end
    xml.set( :value => "#{(@t_coke.sum.to_f/@t_coke.count).round(2) rescue nil}" ) 
  end
  
  xml.dataset(:seriesName=>"Wood(MT)") do
    @t_wood=[]
    @f_expense.sort.each do |f,expense|
      @ft_weight=@t_weight[f].collect(&:weight).sum rescue nil
      expense.each do |e|
        @f_wood=((e.s1_w + e.s2_w + e.s3_w).to_f/@ft_weight ).round(2) rescue nil
        xml.set( :value=> @f_wood )
        @t_wood<<@f_wood.to_f
      end
    end
    xml.set( :value => "#{(@t_wood.sum.to_f/@t_wood.count).round(2) rescue nil}" ) 
  end
  
  
end # end of chart
