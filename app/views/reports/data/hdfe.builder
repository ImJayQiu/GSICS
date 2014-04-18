xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( :caption=>"Chemical Elements of Silicon Metals", :subcaption=>"PO-1020631 (Lot 1)", :hovercapbg=>"FFECAA", 
  :hovercapborder=>"F47E00", :formatNumberScale=>"0", :decimalPrecision=>"3", :showvalues=>"1", 
  :numdivlines=>"5", :numVdivlines=>"0", :yaxisminvalue=>"0", :yaxismaxvalue=>"0.4", :rotateNames=>"0", 
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

  
  xml.dataset(:seriesName=>"Fe", :color=>"1D8BD1", :anchorBorderColor=>"1D8BD1", :anchorBgColor=>"1D8BD1")do
    xml.set( :value=>"0.258" )
    xml.set( :value=>"0.245" )
    xml.set( :value=>"0.248" )
    xml.set( :value=>"0.258" )
    xml.set( :value=>"0.265" )
    xml.set( :value=>"0.266" )
    xml.set( :value=>"0.268" )
    xml.set( :value=>"0.253" )
    xml.set( :value=>"0.248" )
    xml.set( :value=>"0.248" )
    xml.set( :value=>"0.259" )
  end
  
  xml.dataset(:seriesName=>"Al", :color=>"2AD62A", :anchorBorderColor=>"2AD62A", :anchorBgColor=>"2AD62A")do
    xml.set( :value=>"0.101" )
    xml.set( :value=>"0.049" )
    xml.set( :value=>"0.086" )
    xml.set( :value=>"0.082" )
    xml.set( :value=>"0.094" )
    xml.set( :value=>"0.057" )
    xml.set( :value=>"0.071" )
    xml.set( :value=>"0.119" )
    xml.set( :value=>"0.056" )
    xml.set( :value=>"0.114" )
    xml.set( :value=>"0.129" )
  end
  
  
end