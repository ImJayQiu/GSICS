xml = Builder::XmlMarkup.new(:indent=>0)


xml.chart( 
  :caption=>"Products Summary Comparison by Grades",
  :subcaption=>"",
  :xAxisName=>"Date", 
  :yAxisName=>"Weight", 
  :numberPrefix=>"",
  :numberSuffix=>"Kg",
  :showValues=>"0", 
  :numVDivLines=>"10", 
  :showAlternateVGridColor=>"1",
  :AlternateVGridColor=>"e1f5ff",
  :divLineColor=>"e1f5ff", 
  :vdivLineColor=>"e1f5ff", 
  :bgColor=>"E9E9E9", 
  :canvasBorderThickness=>"0", 
  :decimalPrecision=>"0",
  :yaxisminvalue=>"130000"
)do
  
  xml.categories(:rotateNames=>"1")do
    xml.category(:name=>"")
    @date.each do |date, furnace|
      xml.category(:name=>"#{date.strftime("%m%d")}")
    end
    xml.category(:name=>"")
  end
  
  ######################### next is OG ##############################
  @silicon_group = @silicons.group_by {|s|s.grade}
  @silicon_group.sort.each do |grade, silicon|
    xml.dataset(
      :seriesName => grade, 
      :color => "%06x" % (rand * 0xffffff), 
      :areaAlpha => "100", 
      :showAreaborder => "1", 
      :areaBorderThickness => "1", 
      :areaBorderColor => "%06x" % (rand * 0x000000)
    )do
    
      xml.set(:value=>"0")
      @date.each do |date, furnace|
        xml.set(:value=>"#{@silicons.where(:grade=>grade,:date=>date).collect(&:weight).sum rescue nil}")
      end
      xml.set(:value=>"0")
    end
  end
  
 
  xml.trendlines()do
    xml.line(
      :startValue=>"125000",
      :endValue=>"125000",
      :color=>"00ff00",
      :displayValue=>"KPI Target",
      :thickness=>"1",
      :alpha=>"60"
    )
  
    xml.line(
      :startValue=>"3750",
      :endValue=>"3750",
      :color=>"ff0000",
      :displayValue=>"O.G.KPI",
      :thickness=>"1",
      :alpha=>"100"
    )
    
  end
  
end # end of graph
