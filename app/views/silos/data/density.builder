
xml = Builder::XmlMarkup.new(:indent=>0, :encoding => "UTF-8")  


xml.graph(  
  :caption=>"Silo Material Level - Density Monitoring Summary 24H ",
  :PYAxisName=>"Material Level", 
  :SYAxisName=>"Density", 
  :numberPrefix=>"",
  :numberSuffix=>"m",
  :showvalues=>"0", 
  :numDivLines=>"4", 
  :formatNumberScale=>"0", 
  :decimalPrecision=>"1" ,
  :anchorSides=>"5" ,
  :anchorRadius=>"3" ,
  :anchorBorderColor=>"009900",
  :rotateNames=>"1"
)do
   
  xml.categories()do
    
    xml.category( :name=>"Max" )
    
    s.each do |silo|
    
      xml.category( :name=>silo.created_at.strftime("%H:%M") )
    
    end
  end

  xml.dataset(
    :seriesName=>"Material Level", 
    :color=>"AFD8F8", 
    :showValues=>"0"
    
  )do
    
    xml.set( :value=>14)
    
    s.each do |silo|
    
      xml.set( :value=>silo.level)
    
    end
  end

  #  xml.dataset( 
  #    :seriesName=>"Product B", 
  #    :color=>"F6BD0F", 
  #    :showValues=>"0" 
  #  )do
  #    
  #    xml.set( :value=>"41941.19")
  #    
  #  end

  xml.dataset( 
    :seriesName=>"Density", 
    :numberSuffix=>"g/L",
    :color=>"ff0000", 
    :showValues=>"0", 
    :parentYAxis=>"S"
  )do
    
    xml.set( :value=>900)
    
    s.each do |silo|
    
      xml.set( :value=>silo.density)
    
    end
    
  end
 

end