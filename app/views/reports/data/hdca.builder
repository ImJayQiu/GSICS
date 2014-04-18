xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( :caption=>"Chemical Elements of Silicon Metals", :subcaption=>"PO-1020631 (Lot 1)", :hovercapbg=>"FFECAA", 
  :hovercapborder=>"F47E00", :formatNumberScale=>"0", :decimalPrecision=>"3", :showvalues=>"1", 
  :numdivlines=>"5", :numVdivlines=>"0", :yaxisminvalue=>"0", :yaxismaxvalue=>"", :rotateNames=>"0", 
  :yAxisName=>"%")do
  
  xml.categories()do
    xml.category( :name=> "C-1")
    xml.category( :name=> "C-2")
    xml.category( :name=> "C-3")
    xml.category( :name=> "C-4")
    xml.category( :name=> "C-5")
    xml.category( :name=> "C-6")
    xml.category( :name=> "C-7")
    xml.category( :name=> "C-8")
    xml.category( :name=> "C-9")
    xml.category( :name=> "C-10")
    xml.category( :name=> "C-11")
  end


  
  xml.dataset(:seriesName=>"Ca", :color=>"DBDC25", :anchorBorderColor=>"DBDC25", :anchorBgColor=>"DBDC25")do
    xml.set( :value=>"0.019" )
    xml.set( :value=>"0.016" )
    xml.set( :value=>"0.015" )
    xml.set( :value=>"0.017" )
    xml.set( :value=>"0.016" )
    xml.set( :value=>"0.016" )
    xml.set( :value=>"0.017" )
    xml.set( :value=>"0.017" )
    xml.set( :value=>"0.018" )
    xml.set( :value=>"0.021" )
    xml.set( :value=>"0.013" )
  end
  
  xml.dataset(:seriesName=>"Ti", :color=>"F1683C", :anchorBorderColor=>"F1683C", :anchorBgColor=>"F1683C")do
    xml.set( :value=>"0.017" )
    xml.set( :value=>"0.018" )
    xml.set( :value=>"0.019" )
    xml.set( :value=>"0.017" )
    xml.set( :value=>"0.019" )
    xml.set( :value=>"0.016" )
    xml.set( :value=>"0.018" )
    xml.set( :value=>"0.020" )
    xml.set( :value=>"0.018" )
    xml.set( :value=>"0.017" )
    xml.set( :value=>"0.018" )
  end
  
end