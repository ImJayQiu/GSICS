
xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( :caption=>"Bulk Density of Products", :subcaption=>" From Silo - #{@silo}", :hovercapbg=>"FFECAA", 
  :hovercapborder=>"F47E00", :formatNumberScale=>"0", :decimalPrecision=>"0", :showvalues=>"0", 
  :numdivlines=>"7", :numVdivlines=>"0", :yaxisminvalue=>"0", :yaxismaxvalue=>"800", :rotateNames=>"1", 
  :yAxisName=>"Bulk Density")do
  
  xml.categories()do
    ms.each do |ms|
      xml.category( :name=>"")
    end
  end
  
  xml.dataset(:seriesName=>"Density", :color=>"1D8BD1", :anchorBorderColor=>"1D8BD1", :anchorBgColor=>"1D8BD1")do
   
    @ms_date = ms.group_by {|m|m.date}
    @ms_date.each do |date,ms_date|
      ms_date.sort_by{|d|d.bag}.each do |ms_date|
        xml.set(:value=>ms_date.density)
      end
    end
    
  end
  

end