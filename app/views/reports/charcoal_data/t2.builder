xml = Builder::XmlMarkup.new(:indent=>0)


xml.chart( 
  :caption=>"Ash-content Summary",
  :subcaption=>"A.C. Test",
  :xAxisName=>"Index", 
  :yAxisName=>"%", 
  :numberPrefix=>"",
  :numberSuffix=>"%",
  :showValues=>"0", 
  :numVDivLines=>"0", 
  :showAlternateVGridColor=>"1",
  :AlternateVGridColor=>"e1f5ff",
  :divLineColor=>"e1f5ff", 
  :vdivLineColor=>"e1f5ff", 
  :bgColor=>"E9E9E9", 
  :canvasBorderThickness=>"0", 
  :decimalPrecision=>"1",
  :yaxisminvalue=>""
)do
  
  xml.categories(:rotateNames=>"1")do
    xml.category(:name=>"")
    @supplier_period.each_with_index do |c, index|
      xml.category(:name=>"#{index+1 rescue nil}")
    end
    xml.category(:name=>"")
  end
  

  
  xml.dataset(
    :seriesName => "A.C.", 
    :color => "#6271AB", 
    :areaAlpha => "100", 
    :showAreaborder => "1", 
    :areaBorderThickness => "1", 
    :areaBorderColor => "#6271AB"
  )do
    
    xml.set(:value=>"0")
    @supplier_period.each do |c|
      xml.set(:value=>"#{c.t2 rescue nil}")
    end
    xml.set(:value=>"0")
  end
  
 
  xml.trendlines()do
    xml.line(
      :startValue=>"3",
      :endValue=>"3",
      :color=>"#B40404",
      :displayValue=>"S.V.",
      :thickness=>"1",
      :alpha=>"100"
    )
  
    xml.line(
      :startValue=>"#{@supplier_period.average(:t2).round(2) rescue nil}",
      :endValue=>"#{@supplier_period.average(:t2).round(2) rescue nil}",
      :color=>"#31B404",
      :displayValue=>"Avg.",
      :thickness=>"1",
      :alpha=>"100"
    )
    
  end
  
end # end of graph
 
  
  
  
  
  
  
 