xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( 
  :maxLabelWidthPercent=>"20",
  :caption=>"Grades Distribution", 
  :showLabels=>"1",
  :showValues=>"0",
  :decimalPrecision=>"0",
  :numberSuffix=>"", 
  :formatNumberScale=>'1',
  :exportEnabled=>'1',
  :exportAtClient=>'0', 
  :exportAction=>'download',
  :showPercentValues=>'0'
)do

  @grade = f.group_by{ |f|f.grade  }
  @grade.sort.each do |g,f|
    xml.set( :label=>"#{g}", :value=>"#{@grade[g].collect(&:weight).sum}")
  end
end
