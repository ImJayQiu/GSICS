
xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( 
  :caption=>"Grades Distribution Of Inventory",
  :subcaption=>"Total Weight : #{@sm_inventory.collect(&:weight).sum rescue nil} Kg", 
  :showNames=>"1", 
  :showValue=>"1",
  :decimalPrecision=>"0",
  :numberSuffix=>"Kg",
  :formatNumberScale=>'0'
)do
  
 
  @sm_inventory_grade.sort.each do |g,sm|
    xml.set( :name=>"#{g}(#{@sm_inventory_grade[g].collect(&:weight).sum*100/@sm_inventory.collect(&:weight).sum rescue nil}%)", :value=>"#{@sm_inventory_grade[g].collect(&:weight).sum rescue nil}")
  end
  
end

