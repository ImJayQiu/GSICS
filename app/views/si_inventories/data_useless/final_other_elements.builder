xml = Builder::XmlMarkup.new(:indent=>0)

xml.graph( :caption=>"Chemical Elements", :showNames=>"1", :decimalPrecision=>"0", :xAxisName=>"Elements", :yAxisName=>"ppm", :formatNumberScale=>"1")do
  xml.set( :name=>"P", :value=>"#{@element.transpose.map(&:sum)[4] rescue nil}", :color=>"008E8E")
  xml.set( :name=>"B", :value=>"#{@element.transpose.map(&:sum)[5] rescue nil}", :color=>"D64646")
  xml.set( :name=>"Na", :value=>"#{@element.transpose.map(&:sum)[6] rescue nil}", :color=>"8E468E")
  xml.set( :name=>"Cu", :value=>"#{@element.transpose.map(&:sum)[7] rescue nil}", :color=>"588526") 
  xml.set( :name=>"Ni", :value=>"#{@element.transpose.map(&:sum)[8] rescue nil}", :color=>"B3AA00")
  xml.set( :name=>"Mn", :value=>"#{@element.transpose.map(&:sum)[9] rescue nil}", :color=>"AFD801")
  xml.set( :name=>"Sn", :value=>"#{@element.transpose.map(&:sum)[10] rescue nil}", :color=>"34D8F8")
  xml.set( :name=>"K", :value=>"#{@element.transpose.map(&:sum)[11] rescue nil}", :color=>"008ED6") 
  xml.set( :name=>"Pb", :value=>"#{@element.transpose.map(&:sum)[12] rescue nil}", :color=>"9D080D")
  xml.set( :name=>"V", :value=>"#{@element.transpose.map(&:sum)[13] rescue nil}", :color=>"A186BE")
  xml.set( :name=>"Cr", :value=>"#{@element.transpose.map(&:sum)[14] rescue nil}", :color=>"50D8F8")
  xml.set( :name=>"Zn", :value=>"#{@element.transpose.map(&:sum)[15] rescue nil}", :color=>"AFD850") 
  xml.set( :name=>"S", :value=>"#{@element.transpose.map(&:sum)[16] rescue nil}", :color=>"8E468E")
end
