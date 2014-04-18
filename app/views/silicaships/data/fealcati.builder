xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( :caption=>"Chemical Elements of Silicon Metals", :subcaption=>@silicaship.po+" | "+@silicaship.container, :hovercapbg=>"FFECAA", 
  :hovercapborder=>"F47E00", :formatNumberScale=>"0", :decimalPrecision=>"3", :showvalues=>"0", 
  :numdivlines=>"5", :numVdivlines=>"0", :yaxisminvalue=>"0", :yaxismaxvalue=>"0.6", :rotateNames=>"1", 
  :yAxisName=>"%")do
  
  xml.categories()do
    @silicaship.silicashiplots.each do |l|
      xml.category( :name=> "")
    end
  end
  
  xml.dataset(:seriesName=>"Fe", :color=>"1D8BD1", :anchorBorderColor=>"1D8BD1", :anchorBgColor=>"1D8BD1")do
    @silicaship.silicashiplots.each do |l|
      @lot=l.lot
      @sm_lot = Silicon.where( "date=? && furnace=? && shift=? && no=? ","20"+@lot[5,2]+"-"+@lot[7,2]+"-"+@lot[9,2],@lot[3,1], @lot[12,1], @lot[14,1])[0]
      xml.set( :value=>"#{@sm_lot.fe.to_f/10000 rescue nil}" )
    end
  end
  
  xml.dataset(:seriesName=>"Al", :color=>"2AD62A", :anchorBorderColor=>"2AD62A", :anchorBgColor=>"2AD62A")do
    @silicaship.silicashiplots.each do |l|
      @lot=l.lot
      @sm_lot = Silicon.where( "date=? && furnace=? && shift=? && no=? ","20"+@lot[5,2]+"-"+@lot[7,2]+"-"+@lot[9,2],@lot[3,1], @lot[12,1], @lot[14,1])[0]
      xml.set( :value=>"#{@sm_lot.al.to_f/10000 rescue nil}" )
    end
  end
  
  xml.dataset(:seriesName=>"Ca", :color=>"DBDC25", :anchorBorderColor=>"DBDC25", :anchorBgColor=>"DBDC25")do
    @silicaship.silicashiplots.each do |l|
      @lot=l.lot
      @sm_lot = Silicon.where( "date=? && furnace=? && shift=? && no=? ","20"+@lot[5,2]+"-"+@lot[7,2]+"-"+@lot[9,2],@lot[3,1], @lot[12,1], @lot[14,1])[0]
      xml.set( :value=>"#{@sm_lot.ca.to_f/10000 rescue nil}" )
    end
  end
  
  xml.dataset(:seriesName=>"Ti", :color=>"F1683C", :anchorBorderColor=>"F1683C", :anchorBgColor=>"F1683C")do
    @silicaship.silicashiplots.each do |l|
      @lot=l.lot
      @sm_lot = Silicon.where( "date=? && furnace=? && shift=? && no=? ","20"+@lot[5,2]+"-"+@lot[7,2]+"-"+@lot[9,2],@lot[3,1], @lot[12,1], @lot[14,1])[0]
      xml.set( :value=>"#{@sm_lot.ti.to_f/10000 rescue nil}" )
    end
  end
  
end