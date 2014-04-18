xml = Builder::XmlMarkup.new(:indent=>0)


xml.graph( 
  :caption=>"Summary of Sample Test",
  :subcaption=>"by Week",
  :xAxisName=>"Week Number", 
  :yAxisName=>"%", 
  :numberPrefix=>"",
  :numberSuffix=>"%",
  :showValues=>"0",
  :numVDivLines=>"7", 
  :showAlternateVGridColor=>"1",
  :AlternateVGridColor=>"e1f5ff",
  :divLineColor=>"e1f5ff", 
  :vdivLineColor=>"e1f5ff", 
  :bgColor=>"E9E9E9", 
  :canvasBorderThickness=>"0", 
  :decimalPrecision=>"2",
  :yaxismaxvalue=>"8",
  :yaxisminvalue=>"0"
)do
  
  
  xml.categories()do
    xml.category(:name=>"")
    @en = Sampleresult.where(:stype=>"EN").sort_by{|s|s.week}
    @en.each do |en|
      xml.category( :name=>"W#{en.week}")
    end
    xml.category(:name=>"")
  end
  
  ######################### next is OG ##############################
  
  xml.dataset(
    :seriesName => "H2O", 
    :color => "%06x" % (rand * 0xffffff), 
    :areaAlpha => "70", 
    :showAreaborder => "1", 
    :areaBorderThickness => "1", 
    :areaBorderColor => "%06x" % (rand * 0x000000)
  )do
    
    xml.set(:value=>"0")
    @en.each do |en|
      xml.set(:value=>en.h2o)
    end
    xml.set(:value=>"0")
  end
  
  
  xml.dataset(:seriesName=>"LOI950",  :color => "%06x" % (rand * 0xffffff), 
    :areaAlpha => "70", 
    :showAreaborder => "1", 
    :areaBorderThickness => "1", 
    :areaBorderColor => "%06x" % (rand * 0x000000)
  )do   
    xml.set(:value=>"0")
    @en.each do |en|
      xml.set(:value=>en.loi)
    end
    xml.set(:value=>"0")
  end
  
  xml.dataset(:seriesName=>"SiC",  :color => "%06x" % (rand * 0xffffff), 
    :areaAlpha => "70", 
    :showAreaborder => "1", 
    :areaBorderThickness => "1", 
    :areaBorderColor => "%06x" % (rand * 0x000000)
  )do  
    xml.set(:value=>"0")
    @en.each do |en|
      xml.set(:value=>en.sic)
    end
    xml.set(:value=>"0")
  end
  
  xml.dataset(:seriesName=>"C",  :color => "%06x" % (rand * 0xffffff), 
    :areaAlpha => "70", 
    :showAreaborder => "1", 
    :areaBorderThickness => "1", 
    :areaBorderColor => "%06x" % (rand * 0x000000)
  )do
    xml.set(:value=>"0")
    @en.each do |en|
      xml.set(:value=>en.c)
    end
    xml.set(:value=>"0")
  end
  
  #  xml.dataset(:seriesName=>"Density",  :color => "%06x" % (rand * 0xffffff), 
  #    :areaAlpha => "70", 
  #    :showAreaborder => "1", 
  #    :areaBorderThickness => "1", 
  #    :areaBorderColor => "%06x" % (rand * 0x000000)
  #  )do
  #    xml.set(:value=>"0")
  #    @en.each do |en|
  #      xml.set(:value=>en.density)
  #    end
  #    xml.set(:value=>"0")
  #  end
  
  xml.dataset(:seriesName=>"Sieve",  :color => "%06x" % (rand * 0xffffff), 
    :areaAlpha => "70", 
    :showAreaborder => "1", 
    :areaBorderThickness => "1", 
    :areaBorderColor => "%06x" % (rand * 0x000000)
  )do
    xml.set(:value=>"0")
    @en.each do |en|
      xml.set(:value=>en.sieve)
    end
    xml.set(:value=>"0")
  end
  
  xml.dataset(:seriesName=>"Fe2O3",  :color => "%06x" % (rand * 0xffffff), 
    :areaAlpha => "70", 
    :showAreaborder => "1", 
    :areaBorderThickness => "1", 
    :areaBorderColor => "%06x" % (rand * 0x000000)
  )do
    xml.set(:value=>"0")
    @en.each do |en|
      xml.set(:value=>en.fe)
    end
    xml.set(:value=>"0")
  end
  
  
  xml.dataset(:seriesName=>"Al2O3",  :color => "%06x" % (rand * 0xffffff), 
    :areaAlpha => "70", 
    :showAreaborder => "1", 
    :areaBorderThickness => "1", 
    :areaBorderColor => "%06x" % (rand * 0x000000)
  )do
    xml.set(:value=>"0")
    @en.each do |en|
      xml.set(:value=>en.al)
    end
    xml.set(:value=>"0")
  end
  
  xml.dataset(:seriesName=>"CaO",  :color => "%06x" % (rand * 0xffffff), 
    :areaAlpha => "70", 
    :showAreaborder => "1", 
    :areaBorderThickness => "1", 
    :areaBorderColor => "%06x" % (rand * 0x000000)
  )do
    xml.set(:value=>"0")
    @en.each do |en|
      xml.set(:value=>en.ca)
    end
    xml.set(:value=>"0")
  end
  
  xml.dataset(:seriesName=>"MgO",  :color => "%06x" % (rand * 0xffffff), 
    :areaAlpha => "70", 
    :showAreaborder => "1", 
    :areaBorderThickness => "1", 
    :areaBorderColor => "%06x" % (rand * 0x000000)
  )do
    xml.set(:value=>"0")
    @en.each do |en|
      xml.set(:value=>en.mg)
    end
    xml.set(:value=>"0")
  end
  
  xml.dataset(:seriesName=>"Na2O",  :color => "%06x" % (rand * 0xffffff), 
    :areaAlpha => "70", 
    :showAreaborder => "1", 
    :areaBorderThickness => "1", 
    :areaBorderColor => "%06x" % (rand * 0x000000)
  )do
    xml.set(:value=>"0")
    @en.each do |en|
      xml.set(:value=>en.na)
    end
    xml.set(:value=>"0")
  end
  
  xml.dataset(:seriesName=>"K2O",  :color => "%06x" % (rand * 0xffffff), 
    :areaAlpha => "70", 
    :showAreaborder => "1", 
    :areaBorderThickness => "1", 
    :areaBorderColor => "%06x" % (rand * 0x000000)
  )do
    xml.set(:value=>"0")
    @en.each do |en|
      xml.set(:value=>en.k)
    end
    xml.set(:value=>"0")
  end
  
  xml.dataset(:seriesName=>"P2O5",  :color => "%06x" % (rand * 0xffffff), 
    :areaAlpha => "70", 
    :showAreaborder => "1", 
    :areaBorderThickness => "1", 
    :areaBorderColor => "%06x" % (rand * 0x000000)
  )do
    xml.set(:value=>"0")
    @en.each do |en|
      xml.set(:value=>en.p)
    end
    xml.set(:value=>"0")
  end
  
  xml.dataset(:seriesName=>"SO3",  :color => "%06x" % (rand * 0xffffff), 
    :areaAlpha => "70", 
    :showAreaborder => "1", 
    :areaBorderThickness => "1", 
    :areaBorderColor => "%06x" % (rand * 0x000000)
  )do
    xml.set(:value=>"0")
    @en.each do |en|
      xml.set(:value=>en.s)
    end
    xml.set(:value=>"0")
  end
  
  xml.dataset(:seriesName=>"Cl+",  :color => "%06x" % (rand * 0xffffff), 
    :areaAlpha => "70", 
    :showAreaborder => "1", 
    :areaBorderThickness => "1", 
    :areaBorderColor => "%06x" % (rand * 0x000000)
  )do
    xml.set(:value=>"0")
    @en.each do |en|
      xml.set(:value=>en.cl)
    end
    xml.set(:value=>"0")
  end
  
  
  
  
  
  #  xml.trendlines()do
  #    xml.line(
  #      :startValue=>"125000",
  #      :endValue=>"125000",
  #      :color=>"00ff00",
  #      :displayValue=>"KPI Target",
  #      :thickness=>"1",
  #      :alpha=>"60"
  #    )
  #  
  #    xml.line(
  #      :startValue=>"3750",
  #      :endValue=>"3750",
  #      :color=>"ff0000",
  #      :displayValue=>"O.G.KPI",
  #      :thickness=>"1",
  #      :alpha=>"100"
  #    )
  #    
  #  end
  
end # end of graph
 
  
  
 