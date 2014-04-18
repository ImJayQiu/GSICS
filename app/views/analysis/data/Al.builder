xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart(:palette=>'4', :caption=>'Silicon', :subCaption=>'', 
  :showValues=>'0', :divLineDecimalPrecision=>'1', 
  :limitsDecimalPrecision=>'1', :PYAxisName=>'Amount', 
  :SYAxisName=>'%', :numberPrefix=>'', :formatNumberScale=>'0', 
  :chartOrder=>'line,area,column', :canvasBgColor=>'FFFDF4', 
  :dynamicShading=>'1', :startAngX=>'8', :startAngY=>'-17', 
  :endAngX=>'8', :endAngY=>'-17')do 
  
  xml.categories()do

    xml.category( :label=>'Start')
    xml.category( :label=>'A-1')
    xml.category( :label=>'B-1')
    xml.category( :label=>'C-1')   
    xml.category( :label=>'End')
    
    xml.category( :label=>'Start')
    xml.category( :label=>'A-2')
    xml.category( :label=>'B-2')
    xml.category( :label=>'C-2')   
    xml.category( :label=>'End')
    
    xml.category( :label=>'Start')    
    xml.category( :label=>'A-3')
    xml.category( :label=>'B-3')
    xml.category( :label=>'C-3')
    xml.category( :label=>'End')
    
  end

  xml.dataset(:seriesName=>'1', :renderAs=>'Line')do
    
    xml.set( :value=>'0')
    xml.set( :value=>'0.214')
    xml.set( :value=>'0.650')
    xml.set( :value=>'0.2041')
    xml.set( :value=>'0')
    
    xml.set( :value=>'0')
    xml.set( :value=>'0.5171')
    xml.set( :value=>'0.2231')
    xml.set( :value=>'0.1992')
    xml.set( :value=>'0')
      
    xml.set( :value=>'0')
    xml.set( :value=>'0.2347')
    xml.set( :value=>'0.2152')
    xml.set( :value=>'0.2809')
    xml.set( :value=>'0')
    
  end
  
  xml.dataset(:seriesName=>'2', :renderAs=>'Line')do
    
    xml.set( :value=>'0')
    xml.set( :value=>'0.157')
    xml.set( :value=>'0.197')
    xml.set( :value=>'0.2073')
    xml.set( :value=>'0')
      
    xml.set( :value=>'0')
    xml.set( :value=>'0.1884')
    xml.set( :value=>'0.1612')
    xml.set( :value=>'0.4091')
    xml.set( :value=>'0')
    
    xml.set( :value=>'0')
    xml.set( :value=>'0.1446')
    xml.set( :value=>'0.3117')
    xml.set( :value=>'0.2552')
    xml.set( :value=>'0')
    
  end
  
  xml.dataset(:seriesName=>'3', :renderAs=>'Line')do
    
    xml.set( :value=>'0')
    xml.set( :value=>'0.102')
    xml.set( :value=>'0.217')
    xml.set( :value=>'0.2112')
    xml.set( :value=>'0')
    
    xml.set( :value=>'0')
    xml.set( :value=>'0.1845')
    xml.set( :value=>'0.2869')
    xml.set( :value=>'0.3091')
    xml.set( :value=>'0')
    
    xml.set( :value=>'0')
    xml.set( :value=>'0.1938')
    xml.set( :value=>'0.3124')
    xml.set( :value=>'0.3896')
    xml.set( :value=>'0')
      
  end
  #
  #  xml.dataset( :seriesName=>'Profit', :renderAs=>'Area')do
  #    
  #    xml.set( :value=>'4')
  #    xml.set( :value=>'5')
  #    xml.set( :value=>'6')
  #
  #    
  #  end

  #  xml.dataset( :seriesName=>'Predicted Profit', :renderAs=>'Line')do
  #
  #    xml.set( :value=>'7')
  #    xml.set( :value=>'8')
  #    xml.set( :value=>'9')
  #
  #  
 
end

