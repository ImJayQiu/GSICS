xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart(:palette=>'4', :caption=>'Silicon', :subCaption=>'', 
  :showValues=>'0', :divLineDecimalPrecision=>'1', 
  :limitsDecimalPrecision=>'1', :PYAxisName=>'Amount', 
  :SYAxisName=>'%', :numberPrefix=>'', :formatNumberScale=>'0', 
  :chartOrder=>'line,area,column', :canvasBgColor=>'FFFDF4', 
  :dynamicShading=>'1', :startAngX=>'8', :startAngY=>'-17', 
  :endAngX=>'8', :endAngY=>'-17')do 
  
  xml.categories()do

    xml.category( :label=>'A-1')
    xml.category( :label=>'B-1')
    xml.category( :label=>'C-1')   
    
    xml.category( :label=>'A-2')
    xml.category( :label=>'B-2')
    xml.category( :label=>'C-2')   
    
    xml.category( :label=>'A-3')
    xml.category( :label=>'B-3')
    xml.category( :label=>'C-3')
    
  end

  xml.dataset(:seriesName=>'1', :renderAs=>'Line')do
    
    xml.set( :value=>'0.013')
    xml.set( :value=>'0.330')
    xml.set( :value=>'0.0122')
    
    xml.set( :value=>'0.0532')
    xml.set( :value=>'0.0177')
    xml.set( :value=>'0.0119')
      
    xml.set( :value=>'0.0165')
    xml.set( :value=>'0.0244')
    xml.set( :value=>'0.0192')
    
  end
  
  xml.dataset(:seriesName=>'2', :renderAs=>'Line')do
    
    xml.set( :value=>'0.053')
    xml.set( :value=>'0.012')
    xml.set( :value=>'0.014')
      
    xml.set( :value=>'0.0009')
    xml.set( :value=>'0.0124')
    xml.set( :value=>'0.0338')
    
    xml.set( :value=>'0.0366')
    xml.set( :value=>'0.028')
    xml.set( :value=>'0.024')
    
  end
  
  xml.dataset(:seriesName=>'3', :renderAs=>'Line')do
    
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

