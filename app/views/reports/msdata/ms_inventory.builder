xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( :xAxisName=>"Micaosilica Spec", :yAxisName=>"Weight", 
  :caption=>"G.S.Energy Microsilica Inventory of #{@year}", :subCaption=>"Inventory: #{@total_ms_inventory.to_f/1000 rescue nil}MT", 
  :decimalPrecision=>"0", :rotateNames=>"0", :numDivLines=>"9", 
  :numberPrefix=>"",:numberSuffix=>"MT", :showValues=>"1", :formatNumberScale=>"0")do
  
  xml.categories()do 
    @microsilicas_selected_year.group_by { |p|p.bsize}.sort.each do |bsize, p|
      p.group_by { |p|p.m_type}.sort.each do |spec, p| 
        xml.category( :name=>"#{spec rescue nil}-#{bsize rescue nil}Kg" )
      end 
    end
  end
  
  xml.dataset( :seriesName=>"Total Loss On Inventory", :color=>"ff0000", :showValues=>"1")do
    unless @loss_weight_spec_bsize.nil? 
      @loss_weight_spec_bsize.each do |l|
        xml.set( :value=> "#{l.to_f / 1000 rescue nil}" )
      end
    end
  end
  
  xml.dataset( :seriesName=>"Total Shipped", :color=>"F6BD0F", :showValues=>"1")do
    @s_weight_spec_bsize_array.each do |p|
      xml.set( :value => "#{p.to_f / 1000 rescue nil}")
    end
  end
  
  xml.dataset( :seriesName=>"Total Inventory", :color=>"66ccff", :showValues=>"1")do
    unless @inventory_actual.nil? 
      @inventory_actual.each do |i|
        xml.set( :value=> "#{i.to_f / 1000 rescue nil}" )
      end
    end
  end
    
end