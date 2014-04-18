#coding:utf-8
xml = Builder::XmlMarkup.new(:indent=>0)

xml.graph( :caption=>"GS-#{@si_inventory.furnace}-#{@si_inventory.date.strftime("%y%m%d")}-#{@si_inventory.shift}-#{@si_inventory.no}-#{@si_inventory.bag}"+"Chemical Elements", :showNames=>"1", :decimalPrecision=>"0", :xAxisName=>"Chemical Elements", :yAxisName=>"ppm", :formatNumberScale=>"0", :numberSuffix=>"ppm", :yaxisminvalue=>"0")do
  xml.set( :name=>"Fe:#{@element.transpose.map(&:sum)[0].to_f/10000 rescue nil} %", :value=>"#{@element.transpose.map(&:sum)[0] rescue nil}", :color=>"AFD8F8")
  xml.set( :name=>"Al:#{@element.transpose.map(&:sum)[1].to_f/10000 rescue nil} %", :value=>"#{@element.transpose.map(&:sum)[1] rescue nil}", :color=>"F6BD0F")
  xml.set( :name=>"Ca:#{@element.transpose.map(&:sum)[2].to_f/10000 rescue nil} %", :value=>"#{@element.transpose.map(&:sum)[2] rescue nil}", :color=>"8BBA00")
  xml.set( :name=>"Ti:#{@element.transpose.map(&:sum)[3].to_f/10000 rescue nil} %", :value=>"#{@element.transpose.map(&:sum)[3] rescue nil}", :color=>"FF8E46") 
end
