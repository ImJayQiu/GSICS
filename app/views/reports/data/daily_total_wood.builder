
xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( 
  :numberScaleValue=>'1000', 
  :numberScaleUnit=>'MT',
  :caption=>"Wood Distribution",
  :subcaption=>"Total Wood Expense #{(@total_wood.to_f/1000).round(3) rescue nil} MT", 
  :showNames=>"1", 
  :decimalPrecision=>"",
  :numberSuffix=>"", 
  :formatNumberScale=>'1',
  :yAxisMinValue=>'0', 
  :yAxisMaxValue=>'10000'
)do

  
  xml.categories() do
    @expense.each do |e|
      xml.category(:label=>"Furnace-#{e.furnace}")
    end
  end
  
  xml.dataset(:seriesName=>"Wood") do
    @expense.each do |e|
      xml.set(:value=>(e.s1_w+e.s2_w+e.s3_w rescue nil))
    end
  end


  xml.dataset( :seriesName=>"Forcast", :renderAs=>"Line")do
    @furnace_yesterday.sort.each do |furnace, f|
      @yesterday_weight = @furnace_yesterday[furnace].collect(&:weight).sum rescue nil
      xml.set(:value=>(@yesterday_weight*@wood_rate/100 rescue nil) )
    end
  end

end
