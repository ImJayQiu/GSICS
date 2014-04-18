xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart(
  :xAxisName=>"Furnaces",
  :yAxisName=>"Weight", 
  :caption=>"Furnaces Productivity Of Selected Period ( Group by Month )",
  :subCaption=>"Total Weight: #{@silicons.collect(&:weight).sum} kg", 
  :decimalPrecision=>"1", 
  :rotateNames=>"0",
  :numDivLines=>"5", 
  :numberPrefix=>"",
  :numberSuffix=>"(MT)",
  :showValues=>'1',
  :showLabels=>'1',
  :formatNumberScale=>"1",
  :rotateValues=>'1',
  :exportEnabled=>'1',
  :exportAtClient=>'0',
  :exportAction=>'download'
)do
  
  
  
  xml.categories()do  
    
    @furnace.sort.each do |furnace, si|
      xml.category( :name=>"F:#{furnace}[#{@silicons.where(:furnace=>furnace).collect(&:weight).sum*100/@silicons.collect(&:weight).sum}%]")
    end # end of silicons group by furnaces
       
  end # end of categories
  
  
  
   
  @silicon_date_monthly.sort.each do |date, silicons|
    
    xml.dataset( :seriesName=>date, :color=>"%06x" % (rand * 0xffffff), :showValues=>"1")do
      
      silicons.group_by {|s|s.furnace}.sort.each do |furnace, si|
       
        xml.set( :value=>si.collect(&:weight).sum )
        
      end # end of silicons.group_by.each
    
    end # end of dataset
    
  end # end of group_by each
    
    
end # end of chart