xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( 
  :caption=>"Chemical Elements (Unit:ppm) ", 
  :showNames=>"1", :decimalPrecision=>"0", 
  :xAxisName=>"Elements", :yAxisName=>"ppm", 
  :formatNumberScale=>"1"
)do

  xml.set( :name=>"P", :value=>"#{@silicon.p rescue nil}", :color=>"008E8E")
  xml.set( :name=>"B", :value=>"#{@silicon.b rescue nil}", :color=>"D64646")
  xml.set( :name=>"Na", :value=>"#{@silicon.na rescue nil}", :color=>"8E468E")
  xml.set( :name=>"Cu", :value=>"#{@silicon.cu rescue nil}", :color=>"588526") 
  xml.set( :name=>"Ni", :value=>"#{@silicon.ni rescue nil}", :color=>"B3AA00")
  xml.set( :name=>"Mn", :value=>"#{@silicon.mn rescue nil}", :color=>"AFD801")
  xml.set( :name=>"Sn", :value=>"#{@silicon.sn rescue nil}", :color=>"34D8F8")
  xml.set( :name=>"K", :value=>"#{@silicon.k rescue nil}", :color=>"008ED6") 
  xml.set( :name=>"Pb", :value=>"#{@silicon.pb rescue nil}", :color=>"9D080D")
  xml.set( :name=>"V", :value=>"#{@silicon.v rescue nil}", :color=>"A186BE")
  xml.set( :name=>"Cr", :value=>"#{@silicon.cr rescue nil}", :color=>"50D8F8")
  xml.set( :name=>"Zn", :value=>"#{@silicon.zn rescue nil}", :color=>"AFD850") 
  xml.set( :name=>"S", :value=>"#{@silicon.s rescue nil}", :color=>"8E468E")
end
