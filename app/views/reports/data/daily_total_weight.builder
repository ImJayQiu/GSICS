xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( 
  :caption=>"Furnaces Production Summary",
  :subcaption=>"Packing Weight : Gross Weight ", 
  :showNames=>"1", 
  :decimalPrecision=>"3",
  :numberSuffix=>"", 
  :formatNumberScale=>'1',
  :stack100Percent=>"1", 
  :showPercentValues=>"0"
)do
  
  #  @t_weight = @silicons.group_by{ |f|f.furnace  }
  #  @t_weight.sort.each do |f,w|
  #    xml.set( :name=>"Furnace-#{f}", :value=>"#{@t_weight[f].collect(&:weight).sum rescue nil}")
  #  end
  
  # Separate different furnace 
  @t_weight = @silicons.group_by{ |f|f.furnace  }
    
  xml.categories() do
    @t_weight.sort.each do |f,w|
    total_weight = @t_weight[f].collect(&:weight).sum rescue nil
      xml.category(:label=>"Furnace-#{f}{br}#{total_weight}Kg")
    end
  end

  xml.dataset(:seriesName=>"Packing") do
    @t_weight.sort.each do |f,w|
      packing_weight = @si_packing.where(:furnace=>f).sum("weight") rescue nil
      xml.set( :value => (packing_weight rescue nil) ) 
    end
  end
  
  xml.dataset(:seriesName=>"unPack") do
    @t_weight.sort.each do |f,w|
      total_weight = @t_weight[f].collect(&:weight).sum rescue nil
      packing_weight = @si_packing.where(:furnace=>f).sum("weight") rescue nil
      xml.set( :value => (total_weight - packing_weight rescue nil) ) 
    end
  end
  
end # end of chart
