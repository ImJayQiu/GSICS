xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( 
  :caption=>"Grades Distribution",
  :subcaption=>"Total Weight : #{f.collect(&:weight).sum} Kg", 
  :showNames=>"1", 
  :decimalPrecision=>"3",
  :numberSuffix=>"", 
  :formatNumberScale=>'1'
)do
  
  @grade = f.group_by{ |f|f.grade  }
  @grade.sort.each do |g,furnace|
    xml.set( :name=>"#{g}(#{@grade[g].collect(&:weight).sum*100/f.collect(&:weight).sum rescue nil}%)", :value=>"#{@grade[g].collect(&:weight).sum}")
  end
  
end

#{@grade[g].collect(&:weight).sum}