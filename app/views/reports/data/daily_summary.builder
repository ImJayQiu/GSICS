
xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( 
  :caption=>"Grades Distribution",
  :subcaption=>"Total Gross Weight : #{@silicons.collect(&:weight).sum rescue nil} Kg", 
  :showNames=>"1", 
  :showValue=>"1",
  :decimalPrecision=>"0",
  :numberSuffix=>"Kg",
  :formatNumberScale=>'0'
)do
  
  @grade = @silicons.group_by{ |f|f.grade  }
  @grade.sort.each do |g,furnace|
    xml.set( :name=>"#{g}(#{@grade[g].collect(&:weight).sum*100/@silicons.collect(&:weight).sum rescue nil}%)", :value=>"#{@grade[g].collect(&:weight).sum rescue nil}")
  end
  
end

