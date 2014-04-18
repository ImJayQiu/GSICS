xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( 
  :caption=>'Grades Distribution',
  :subcaption=>'Total Weight : '+@silicons.collect(&:weight).sum.to_s+'Kg', 
  :showNames=>'1', 
  :showValue=>'1',
  :decimalPrecision=>'0',
  :numberSuffix=>'Kg',
  :formatNumberScale=>'0',
  :exportEnabled=>'1',
  :exportAtClient=>'0',
  :exportAction=>'download'
)do
  
  @grade = @silicons.group_by{ |f|f.grade  }
  @grade.sort.each do |g,furnace|
    xml.set( :name=>g+' ('+(@grade[g].collect(&:weight).sum.to_f*100/@silicons.collect(&:weight).sum).round(2).to_s+'%)', :value=>@grade[g].collect(&:weight).sum.to_s )
  end
  
end
