xml = Builder::XmlMarkup.new(:indent=>0)


xml.chart( 
  :caption=>"Moistrue Content Summary",
  :subcaption=>"M.C. Test",
  :xAxisName=>"Index", 
  :yAxisName=>"%", 
  :numberPrefix=>"",
  :numberSuffix=>"%",
  :showValues=>"0", 
  :numVDivLines=>"#{@supplier_period.count rescue nil}", 
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
    :seriesName => "M.C.", 
    :color => "#81BEF7", 
    :areaAlpha => "100", 
    :showAreaborder => "1", 
    :areaBorderThickness => "1", 
    :areaBorderColor => "#0000FF"
  )do
    
    xml.set(:value=>"0")
    @supplier_period.each do |c|
      xml.set(:value=>"#{c.t1 rescue nil}")
    end
    xml.set(:value=>"0")
  end
  
 
  xml.trendlines()do
    xml.line(
      :startValue=>"7",
      :endValue=>"7",
      :color=>"#B40404",
      :displayValue=>"S.V.",
      :thickness=>"1",
      :alpha=>"100"
    )
  
    xml.line(
      :startValue=>"#{@supplier_period.average(:t1).round(2) rescue nil}",
      :endValue=>"#{@supplier_period.average(:t1).round(2) rescue nil}",
      :color=>"#31B404",
      :displayValue=>"Avg.",
      :thickness=>"1",
      :alpha=>"100"
    )
    
  end
  
end # end of graph
 
  
  
  
  
  
  
 