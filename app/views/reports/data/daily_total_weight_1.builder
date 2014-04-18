xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( 
  :caption=>"Furnaces Productivity",
  :subcaption=>"Total Weight : #{@silicons.collect(&:weight).sum rescue nil} Kg", 
  :showNames=>"1", 
  :decimalPrecision=>"3",
  :numberSuffix=>"", 
  :formatNumberScale=>'1'
)do
  
  @t_weight = @silicons.group_by{ |f|f.furnace  }
  @t_weight.sort.each do |f,w|
    xml.set( :name=>"Furnace-#{f}", :value=>"#{@t_weight[f].collect(&:weight).sum rescue nil}")
  end
  
end

#{@grade[g].collect(&:weight).sum}