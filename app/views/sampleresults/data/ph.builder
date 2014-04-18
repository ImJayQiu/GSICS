
xml = Builder::XmlMarkup.new(:indent=>0)

xml.graph( :caption=>"Summary of Sample Test", :subcaption=>" by Week", :hovercapbg=>"FFECAA", 
  :hovercapborder=>"F47E00", :formatNumberScale=>"0", :decimalPrecision=>"1", :showvalues=>"0", 
  :numdivlines=>"6", :numVdivlines=>"0", :yaxisminvalue=>"0", :yaxismaxvalue=>"14", :rotateNames=>"0", 
  :xAxisName=>"Week Number",:yAxisName=>"Ph Value")do
  
  xml.categories()do
    @en = Sampleresult.where(:stype=>"EN").sort_by{|s|s.week}
    
    @en.each do |en|
      xml.category( :name=>"W#{en.week}")
    end
  end
  
  xml.dataset(:seriesName=>"Ph Value", :color=>"ee0000", :anchorBorderColor=>"ee0000", :anchorBgColor=>"ee0000")do
   
    @en.each do |en|
      xml.set(:value=>en.ph)
    end
  end
  
    
end
  
