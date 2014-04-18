
xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( :caption=>"Quantity and Bags NO. Checking", :subcaption=>"", :hovercapbg=>"FFECAA", 
  :hovercapborder=>"F47E00", :formatNumberScale=>"0", :decimalPrecision=>"0", :showvalues=>"0", 
  :numdivlines=>"0", :numVdivlines=>"0", :yaxisminvalue=>"0", :yaxismaxvalue=>"0", :rotateNames=>"1", 
  :yAxisName=>"Bag's No.")do
  
 
  
  xml.categories()do
    ms.each_with_index do |ms,index|
      xml.category( :name=>"")
    end
  end
  
  xml.dataset(:seriesName=>"Bag NO.", :color=>"99cc99", :anchorBorderColor=>"99cc99", :anchorBgColor=>"99cc99")do
    @ms_date = ms.group_by {|m|m.date}
    @ms_date.each do |date,ms_date|
      ms_date.sort_by{|d|d.bag}.each do |ms_date|
        xml.set(:value=>ms_date.bag)
      end
    end
  end
  
  xml.dataset(:seriesName=>"Index", :color=>"F984A1", :anchorBorderColor=>"F984A1", :anchorBgColor=>"F984A1")do
   
    ms.each_with_index do |ms,index|
      xml.set(:value=>index+1)
    end
  end

end