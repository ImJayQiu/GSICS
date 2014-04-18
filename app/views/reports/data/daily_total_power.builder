
xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart(
  :numberScaleValue=>'1000', 
  :numberScaleUnit=>'Kw',
  :caption=>"Power Distribution",
  :subcaption=>"Total Power Consumption #{(@total_power.to_f/1000).round(3) rescue nil} Kw", 
  :showNames=>"1", 
  :decimalPrecision=>"",
  :numberSuffix=>"", 
  :formatNumberScale=>'1',
  :yAxisMinValue=>'0', 
  :yAxisMaxValue=>'400000'
)do
  
 
  
  xml.categories() do
    @expense.each do |e|
      xml.category(:label=>"Furnace-#{e.furnace}")
    end
  end
  
  xml.dataset(:seriesName=>"Electricity") do
    @total_e=[]
    @expense.each do |e|
      xml.set(:value=>( @f_total_e = e.s1_e + e.s2_e + e.s3_e rescue nil))
      @total_e<<@f_total_e.to_i
    end
  end
  @power_average="#{(@total_e.sum/@total_e.count).round(2) rescue nil}".to_i

  xml.trendlines()do
    xml.line( :startValue=>@power_average, :endValue=>@power_average, :color=>"ff0000", :displayValue=>"#{@power_average/1000 rescue nil}Kw", :dashed=>"", :thickness=>"2", :dashGap=>"6", :alpha=>"100", :showOnTop=>"1")
  end

  
end
