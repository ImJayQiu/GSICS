xml = Builder::XmlMarkup.new(:indent=>0)
  
total_in = @ms_bag_inventories.where(:bag_type=>code,:action=>"IN").sum(:quantity).to_i 
# total_in_sum = total_in.quantity.sum
total_out = @ms_bag_inventories.where(:bag_type=>code,:action=>"OUT").sum(:quantity).to_i 
total_inventory = total_in - total_out

buffer=total_inventory-safety

xml.chart( 
  :manageResize=>"1",
  :bgColor=>"FFFFFF", 
  :borderColor=>"DCCEA1", 
  :chartTopMargin=>"0", 
  :chartBottomMargin=>"0", 
  :upperLimit=>total_inventory, 
  :lowerLimit=>"0", 
  :ticksBelowGauge=>"1", 
  :tickMarkDistance=>"3" ,
  :valuePadding=>"0",
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
  
  if total_inventory == 0
    
    xml.colorRange()do
      xml.color( :minValue=>0, :maxValue=>0, :code=>"B40001",  :label=>"#{code} | Out Of Stock ")
      #xml.color( :minValue=>0, :maxValue=>0, :code=>"5C8F0E",  :label=>"" )
    end
  
    xml.pointers()do
      xml.pointer(:value=>total_inventory)
    end
    
  elsif safety >= total_inventory
    
    
    xml.colorRange()do
      xml.color( :minValue=>0, :maxValue=>total_inventory, :code=>"B40001",  :label=>"#{code} | Safety Stock ( #{buffer} ) ")
      xml.color( :minValue=>0, :maxValue=>total_inventory, :code=>"5C8F0E",  :label=>"" )
    end
  
    xml.pointers()do
      xml.pointer(:value=>total_inventory)
    end
    
    
  else
    
    xml.colorRange()do
      xml.color( :minValue=>0, :maxValue=>safety, :code=>"B40001",  :label=>"#{code} | Safety Stock")
      xml.color( :minValue=>safety, :maxValue=>total_inventory, :code=>"5C8F0E",  :label=>"Stock ( #{buffer} ) " )
    end
  
    xml.pointers()do
      xml.pointer(:value=>safety)
    end
  
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
  
  
  
 