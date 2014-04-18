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
    xml.set( :value=>'0.3491')
    xml.set( :value=>'0.3523')
    xml.set( :value=>'0.3068')
    xml.set( :value=>'0')
    
    xml.set( :value=>'0')
    xml.set( :value=>'0.6621')
    xml.set( :value=>'0.3793')
    xml.set( :value=>'0.2775')
    xml.set( :value=>'0')
    
    xml.set( :value=>'0')
    xml.set( :value=>'0.3003')
    xml.set( :value=>'0.2933')
    xml.set( :value=>'0.4329')
    xml.set( :value=>'0')
  end
  
  xml.dataset(:seriesName=>'2', :renderAs=>'Line')do
    
    xml.set( :value=>'0')
    xml.set( :value=>'0.2761')
    xml.set( :value=>'0.289')
    xml.set( :value=>'0.3626')
    xml.set( :value=>'0')
      
    xml.set( :value=>'0')
    xml.set( :value=>'0.41')
    xml.set( :value=>'0.2405')
    xml.set( :value=>'0.497')
    xml.set( :value=>'0')
    
    xml.set( :value=>'0')
    xml.set( :value=>'0.4151')
    xml.set( :value=>'0.3573')
    xml.set( :value=>'0.311')
    xml.set( :value=>'0')
    
  end
  
  xml.dataset(:seriesName=>'3', :renderAs=>'Line')do
    
    xml.set( :value=>'0')
    xml.set( :value=>'0.3287')
    xml.set( :value=>'0.2849')
    xml.set( :value=>'0.3086')
    xml.set( :value=>'0')
    
    xml.set( :value=>'0')
    xml.set( :value=>'0.4081')
    xml.set( :value=>'0.3293')
    xml.set( :value=>'0.4244')
    xml.set( :value=>'0')
    
    xml.set( :value=>'0')
    xml.set( :value=>'0.414')
    xml.set( :value=>'0.4136')
    xml.set( :value=>'0.4915')
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

