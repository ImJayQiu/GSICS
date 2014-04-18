xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( :caption=>"Chemical Elements of Silicon Metals", :subcaption=>"", :hovercapbg=>"FFECAA", 
  :hovercapborder=>"F47E00", :formatNumberScale=>"0", :decimalPrecision=>"3", :showvalues=>"0", 
  :numdivlines=>"5", :numVdivlines=>"0", :yaxisminvalue=>"0", :yaxismaxvalue=>"0.6", :rotateNames=>"1", 
  :yAxisName=>"%")do
  
  xml.categories()do
    f.each do |f|
      xml.category( :name=> "")
      # s:#{f.shift}-#{f.no}<br/>#{f.grade}
    end
  end
  
  xml.dataset(:seriesName=>"Fe", :color=>"1D8BD1", :anchorBorderColor=>"1D8BD1", :anchorBgColor=>"1D8BD1")do
    f.each do |f|
      xml.set(:value=>f.fe.to_f/10000)
    end
  end
  
  xml.dataset(:seriesName=>"Al", :color=>"2AD62A", :anchorBorderColor=>"2AD62A", :anchorBgColor=>"2AD62A")do
    f.each do |f|
      xml.set(:value=>f.al.to_f/10000)
    end
  end
  
  xml.dataset(:seriesName=>"Ca", :color=>"DBDC25", :anchorBorderColor=>"DBDC25", :anchorBgColor=>"DBDC25")do
    f.each do |f|
      xml.set(:value=>f.ca.to_f/10000)
    end
  end
  
  #  xml.dataset(:seriesName=>"Ti", :color=>"F1683C", :anchorBorderColor=>"F1683C", :anchorBgColor=>"F1683C")do
  #    f.each do |f|
  #      xml.set(:value=>f.ti)
  #    end
  #  end
  
end