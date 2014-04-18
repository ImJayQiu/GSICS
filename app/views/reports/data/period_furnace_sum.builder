xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( :xAxisName=>"Furnaces", :yAxisName=>"Weight", 
  :caption=>"Furnaces Productivity Of Selected Period", :subCaption=>"Total Weight: #{@silicons.collect(&:weight).sum} kg", 
  :decimalPrecision=>"0", :rotateNames=>"0", :numDivLines=>"3", 
  :numberPrefix=>"",:numberSuffix=>"Kg", :showValues=>"1", :formatNumberScale=>"0")do
  
  xml.categories()do  
    xml.category( :name=>"1[#{@silicons.where(:furnace=>'1').collect(&:weight).sum*100/@silicons.collect(&:weight).sum rescue nil}%]")
    xml.category( :name=>"2[#{@silicons.where(:furnace=>'2').collect(&:weight).sum*100/@silicons.collect(&:weight).sum rescue nil}%]")
    xml.category( :name=>"3[#{@silicons.where(:furnace=>'3').collect(&:weight).sum*100/@silicons.collect(&:weight).sum rescue nil}%]")
    xml.category( :name=>"4[#{@silicons.where(:furnace=>'4').collect(&:weight).sum*100/@silicons.collect(&:weight).sum rescue nil}%]")
    xml.category( :name=>"5[#{@silicons.where(:furnace=>'5').collect(&:weight).sum*100/@silicons.collect(&:weight).sum rescue nil}%]")
    xml.category( :name=>"6[#{@silicons.where(:furnace=>'6').collect(&:weight).sum*100/@silicons.collect(&:weight).sum rescue nil}%]")
  end
  
  
  xml.dataset( :seriesName=>"Total Production", :color=>"66ccff", :showValues=>"1")do
   
    xml.set( :value=>(@silicons.where(:furnace=>'1').collect(&:weight).sum rescue nil))
    xml.set( :value=>(@silicons.where(:furnace=>'2').collect(&:weight).sum rescue nil))
    xml.set( :value=>(@silicons.where(:furnace=>'3').collect(&:weight).sum rescue nil))
    xml.set( :value=>(@silicons.where(:furnace=>'4').collect(&:weight).sum rescue nil))
    xml.set( :value=>(@silicons.where(:furnace=>'5').collect(&:weight).sum rescue nil))
    xml.set( :value=>(@silicons.where(:furnace=>'6').collect(&:weight).sum rescue nil))
  end
  
end