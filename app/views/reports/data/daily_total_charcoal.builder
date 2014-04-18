
xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( 
  :numberScaleValue=>'1000', 
  :numberScaleUnit=>'MT',
  :caption=>"Charcoal Distribution",
  :subcaption=>"Total Charcoal Expense #{(@total_charcoal.to_f/1000).round(3) rescue nil} MT", 
  :showNames=>"1", 
  :decimalPrecision=>"",
  :numberSuffix=>"", 
  :formatNumberScale=>'1',
  :yAxisMinValue=>'0', 
  :yAxisMaxValue=>'50000'
)do

  
  xml.categories() do
    @expense.each do |e|
      xml.category(:label=>"Furnace-#{e.furnace}")
    end
  end
  
  xml.dataset(:seriesName=>"Charcoal") do
    @expense.each do |e|
      xml.set(:value=>(e.s1_ch+e.s2_ch+e.s3_ch rescue nil))
    end
  end


  xml.dataset( :seriesName=>"Forcast", :renderAs=>"Line")do
    @furnace_yesterday.sort.each do |furnace, f|
      @yesterday_weight = @furnace_yesterday[furnace].collect(&:weight).sum rescue nil
      xml.set(:value=>(@yesterday_weight*@charcoal_rate/100 rescue nil) )
    end
  end

end
