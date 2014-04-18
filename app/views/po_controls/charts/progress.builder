xml = Builder::XmlMarkup.new(:indent=>0)
  
xml.chart( 
  :manageResize=>"1",
  :bgColor=>"FFFFFF", 
  :borderColor=>"DCCEA1", 
  :chartTopMargin=>"0", 
  :chartBottomMargin=>"0", 
  :upperLimit=>"100", 
  :lowerLimit=>"0", 
  :ticksBelowGauge=>"1", 
  :tickMarkDistance=>"3" ,
  :valuePadding=>"-2",
  :pointerRadius=>"5", 
  :majorTMColor=>"000000" ,
  :majorTMNumber=>"3" ,
  :minorTMNumber=>"4" ,
  :minorTMHeight=>"4" ,
  :majorTMHeight=>"8" ,
  :showShadow=>"0" ,
  :pointerBgColor=>"FFFFFF" ,
  :pointerBorderColor=>"000000", 
  :gaugeBorderThickness=>"3" ,
  :baseFontColor=>"000000" ,
  :gaugeFillMix=>"{color},{FFFFFF}" ,
  :gaugeFillRatio=>"50,50")do
  
  xml.colorRange()do
    xml.color( :minValue=>"0", :maxValue=>@po_status, :code=>"5C8F0E",  :label=>"Shipped\n#{(@total_shipped.to_f/1000).round(2)} MT")
    xml.color( :minValue=>@po_status, :maxValue=>"100", :code=>"B40001",  :label=>"Pending\n#{(@po_pending.to_f/1000).round(2)} MT" )
  end
  xml.pointers()do
    xml.pointer(:value=>@po_status)
  end
  xml.styles()do
    xml.definition()do
      xml.style( :name=>"limitFont", :type=>"Font", :bold=>"1")
      xml.style(:name=>"labelFont", :type=>"Font", :bold=>"1", :size=>"10", :color=>"FFFFFF")
    end
    xml.application()do
      xml.apply( :toObject=>"GAUGELABELS", :styles=>"labelFont")
      xml.apply( :toObject=>"LIMITVALUES", :styles=>"limitFont")
    end
  end
  
end
  
  
  
 