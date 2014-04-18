xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( :caption=>"Chemical Elements of Silicon Metals", :subcaption=>"PO-1020631 (Lot 1)", :hovercapbg=>"FFECAA", 
  :hovercapborder=>"F47E00", :formatNumberScale=>"0", :decimalPrecision=>"3", :showvalues=>"1", 
  :numdivlines=>"5", :numVdivlines=>"0", :yaxisminvalue=>"-10", :yaxismaxvalue=>"50", :rotateNames=>"0", 
  :yAxisName=>"ppm")do
  
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

  
  xml.dataset(:seriesName=>"P", :color=>"1D8BD1", :anchorBorderColor=>"1D8BD1", :anchorBgColor=>"1D8BD1")do
    xml.set( :value=>"32.42" )
    xml.set( :value=>"34.94" )
    xml.set( :value=>"35.34" )
    xml.set( :value=>"36.48" )
    xml.set( :value=>"35.69" )
    xml.set( :value=>"35.41" )
    xml.set( :value=>"34.41" )
    xml.set( :value=>"36.74" )
    xml.set( :value=>"35.30" )
    xml.set( :value=>"36.60" )
    xml.set( :value=>"36.06" )
  end
  
  xml.dataset(:seriesName=>"B", :color=>"2AD62A", :anchorBorderColor=>"2AD62A", :anchorBgColor=>"2AD62A")do
    xml.set( :value=>"1.40" )
    xml.set( :value=>"3.33" )
    xml.set( :value=>"1.83" )
    xml.set( :value=>"1.03" )
    xml.set( :value=>"1.54" )
    xml.set( :value=>"1.04" )
    xml.set( :value=>"1.07" )
    xml.set( :value=>"3.01" )
    xml.set( :value=>"4.33" )
    xml.set( :value=>"4.75" )
    xml.set( :value=>"4.83" )
  end
  
 
  
end