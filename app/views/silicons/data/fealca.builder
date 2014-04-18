xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( 
  :caption=>"GS-#{@silicon.furnace}-#{@silicon.date.strftime("%y%m%d")}-#{@silicon.shift}-#{@silicon.no}"+" Chemical Elements (Unit:ppm)", 
  :showNames=>"1", 
  :decimalPrecision=>"0", 
  :xAxisName=>"", 
  :yAxisName=>"", 
  :formatNumberScale=>"0", 
  :numberSuffix=>"", 
  :yaxisminvalue=>"0"
)do
  
  xml.set( :name=>"Fe:#{@silicon.fe.to_f/10000 rescue nil} %", :value=>"#{@silicon.fe rescue nil}", :color=>"AFD8F8")
  xml.set( :name=>"Al:#{@silicon.al.to_f/10000 rescue nil} %", :value=>"#{@silicon.al rescue nil}", :color=>"F6BD0F")
  xml.set( :name=>"Ca:#{@silicon.ca.to_f/10000 rescue nil} %", :value=>"#{@silicon.ca rescue nil}", :color=>"8BBA00")
  xml.set( :name=>"Ti:#{@silicon.ti.to_f/10000 rescue nil} %", :value=>"#{@silicon.ti rescue nil}", :color=>"FF8E46") 


end
