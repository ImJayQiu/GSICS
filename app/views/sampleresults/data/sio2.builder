
xml = Builder::XmlMarkup.new(:indent=>0)

xml.graph( :caption=>"Summary of Sample Test", :subcaption=>" by Week", :hovercapbg=>"FFECAA", 
  :hovercapborder=>"F47E00", :formatNumberScale=>"0", :decimalPrecision=>"2", :showvalues=>"0", 
  :numdivlines=>"5", :numVdivlines=>"0", :yaxisminvalue=>"0", :yaxismaxvalue=>"120", :rotateNames=>"0", 
  :xAxisName=>"Week Number",:yAxisName=>"%", :numberSuffix=>"%")do
  
  xml.categories()do
    @en = Sampleresult.where(:stype=>"EN").sort_by{|s|s.week}
    
    @en.each do |en|
      xml.category( :name=>"W#{en.week}")
    end
  end
  
  xml.dataset(:seriesName=>"SiO2", :color=>"1D8BD1", :anchorBorderColor=>"1D8BD1", :anchorBgColor=>"1D8BD1")do
   
    @en.each do |en|
      xml.set(:value=>en.sio2)
    end
  end
  
    
end
  
