
xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( 
  :numberScaleValue=>'1000', 
  :numberScaleUnit=>'MT',
  :caption=>"Petro Coke Distribution",
  :subcaption=>"Total Petro Coke Expense #{(@total_coke.to_f/1000).round(3)} MT", 
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
  
  xml.dataset(:seriesName=>"Petro Coke") do
    @expense.each do |e|
      xml.set(:value=>(e.s1_c+e.s2_c+e.s3_c rescue nil))
    end
  end


  xml.dataset( :seriesName=>"Forcast", :renderAs=>"Line")do
    @furnace_yesterday.sort.each do |furnace, f|
      @yesterday_weight = @furnace_yesterday[furnace].collect(&:weight).sum rescue nil
      xml.set(:value=>(@yesterday_weight*@coke_rate/100 rescue nil) )
    end
  end

end
