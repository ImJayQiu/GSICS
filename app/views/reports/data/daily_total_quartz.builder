
xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( 
  :numberScaleValue=>'1000', 
  :numberScaleUnit=>'MT',
  :caption=>"Quartz Distribution",
  :subcaption=>"Total Quartz Expense #{(@total_quartz.to_f/1000).round(3) rescue nil} MT", 
  :showNames=>"1", 
  :decimalPrecision=>"",
  :numberSuffix=>"", 
  :formatNumberScale=>'1',
  :yAxisMinValue=>'0', 
  :yAxisMaxValue=>'100000'
)do

  
  xml.categories() do
    @expense.each do |e|
      xml.category(:label=>"Furnace-#{e.furnace}")
    end
  end
  
  xml.dataset(:seriesName=>"Quartz") do
    @expense.each do |e|
      xml.set(:value=>(e.s1_q+e.s2_q+e.s3_q rescue nil))
    end
  end


  xml.dataset( :seriesName=>"Forcast", :renderAs=>"Line")do
    @furnace_yesterday.sort.each do |furnace, f|
      @yesterday_weight = @furnace_yesterday[furnace].collect(&:weight).sum rescue nil
      xml.set(:value=>(@yesterday_weight*@quartz_rate/100 rescue nil) )
    end
  end

end
