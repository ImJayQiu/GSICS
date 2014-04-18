xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( :caption=>"Chemical Elements of Silicon Metals", :subcaption=>"", :hovercapbg=>"FFECAA", 
  :hovercapborder=>"F47E00", :formatNumberScale=>"0", :decimalPrecision=>"3", :showvalues=>"1", 
  :numdivlines=>"5", :numVdivlines=>"0", :yaxisminvalue=>"-0.1", :yaxismaxvalue=>"0.5", :rotateNames=>"0", 
  :yAxisName=>"%")do
  
  xml.categories()do
    xml.category( :name=> "start")
    f.each do |f|
      xml.category( :name=> "s:#{f.shift}-#{f.no}\n#{f.grade}")   
    end
    xml.category( :name=> "end")
  end
  
  xml.dataset(:seriesName=>"Fe", :color=>"1D8BD1", :anchorBorderColor=>"1D8BD1", :anchorBgColor=>"1D8BD1")do
    xml.set(:value=>"")
    f.each do |f|
      xml.set(:value=>(f.fe.to_f/10000 rescue nil))
    end
    xml.set(:value=>"")
  end
  
  xml.dataset(:seriesName=>"Al", :color=>"2AD62A", :anchorBorderColor=>"2AD62A", :anchorBgColor=>"2AD62A")do
    xml.set(:value=>"")
    f.each do |f|
      xml.set(:value=>(f.al.to_f/10000 rescue nil))
    end
    xml.set(:value=>"")
  end
  
  xml.dataset(:seriesName=>"Ca", :color=>"DBDC25", :anchorBorderColor=>"DBDC25", :anchorBgColor=>"DBDC25")do
    xml.set(:value=>"")
    f.each do |f|
      xml.set(:value=>(f.ca.to_f/10000 rescue nil))
    end
    xml.set(:value=>"")
  end
  
end