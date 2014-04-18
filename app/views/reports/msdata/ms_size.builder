xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( 
  :labelDisplay=>'WRAP',
  :caption=>'Microsilica Spec Distribution',
  :subcaption=>"Total Weight: #{@microsilicas.collect(&:bsize).sum rescue nil} Kg", 
  :showLabels=>'1', 
  :showPercentageInLabel=>'0',
  :showValues=>'1',
  :decimalPrecision=>'0',
  :numberSuffix=>'Kg',
  :formatNumberScale=>'0',
  :showLegend=>'1',
  :exportEnabled=>'1',
  :exportAtClient=>'1',
  :exportAction=>'download'
)do
  
  @specs = @microsilicas.group_by{ |m|m.m_type }
  @specs.sort.each do |spec,ms|
    ms.group_by{|s| s.bsize }.sort.each do |size, ms|
      #  xml.set( :label=>"#{spec}-#{size}Kg, Bags:#{ms.count rescue nil}, #{ms.collect(&:bsize).sum*100/@microsilicas.collect(&:bsize).sum rescue nil}%", :value=>"#{ms.collect(&:bsize).sum rescue nil}")
      xml.set( :label=>"#{spec}-#{size}", :toolText=>"Bags:#{ms.count rescue nil},  #{ms.collect(&:bsize).sum*100/@microsilicas.collect(&:bsize).sum rescue nil}%", :value=>"#{ms.collect(&:bsize).sum rescue nil}")
    end
  end
  
end

