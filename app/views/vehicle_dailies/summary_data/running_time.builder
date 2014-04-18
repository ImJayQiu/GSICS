xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( 
  :caption=>"Fuel Usage (Unit:L)", 
  :subcaption=>"", 
  :hovercapbg=>"FFECAA", 
  :hovercapborder=>"F47E00", 
  :formatNumberScale=>"0", 
  :decimalPrecision=>"3", 
  :showvalues=>"0", 
  :numdivlines=>"5", 
  :numVdivlines=>"0", 
  :yaxisminvalue=>"0", 
  :yaxismaxvalue=>"0.6", 
  :rotateNames=>"0",
  :exportEnabled=>'1',
  :exportAtClient=>'0', 
  :exportAction=>'download',
  :yAxisName=>"")do
  
  @vd = vd.group_by {|vd|vd.date}
  @vdv = vd.group_by {|vd|vd.v_id}
  
  xml.categories()do
    @vd.sort.each do |date,vd|
      xml.category( :name=>date)
      #{f.date.strftime("%m%d")}
    end
  end
  
  @vdv.sort.each do |id,vdv|
    @color="%06x" % (rand * 0xffffff)
    xml.dataset(:seriesName=>id, :color=>@color, :anchorBorderColor=>@color, :anchorBgColor=>@color )do
      @vdvd= vdv.group_by {|vdv|vdv.date}
      @vdvd.sort.each do |date,vdvd|
        vdvd.sort.each do |vdvd|
          xml.set(:value=>vdvd.rtime)
        end
      end
    end
  end
  
end