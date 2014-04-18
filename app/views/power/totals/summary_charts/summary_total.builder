xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( :caption=>"Power Consumption", :subcaption=>"", :hovercapbg=>"FFECAA", 
  :hovercapborder=>"F47E00", :formatNumberScale=>"0", :decimalPrecision=>"3", :showvalues=>"0", 
  :numdivlines=>"5", :numVdivlines=>"0", :yaxisminvalue=>"0", :yaxismaxvalue=>"0", :rotateNames=>"1", 
  :yAxisName=>"")do
  
  xml.categories()do
    @total_power.each_cons 2 do |power,next_power|
      xml.category( :name=> power.date)
      # s:#{f.shift}-#{f.no}<br/>#{f.grade}
    end
  end
  
  xml.dataset(:seriesName=>"MT-1", :color=>"1D8BD1", :anchorBorderColor=>"1D8BD1", :anchorBgColor=>"1D8BD1")do
    @total_power.each_cons 2 do |power,next_power|
      xml.set( :value=>((next_power.m_1.to_f-power.m_1.to_f)*@f_m1).round(2) )
    end
  end
  
  xml.dataset(:seriesName=>"MT-2", :color=>"2AD62A", :anchorBorderColor=>"2AD62A", :anchorBgColor=>"2AD62A")do
    @total_power.each_cons 2 do |power,next_power|
      xml.set( :value=>((next_power.m_2.to_f-power.m_2.to_f)*@f_m2).round(2) )
    end
  end
  
  xml.dataset(:seriesName=>"Env.", :color=>"DBDC25", :anchorBorderColor=>"DBDC25", :anchorBgColor=>"DBDC25")do
    @total_power.each_cons 2 do |power,next_power|
      xml.set( :value=>((next_power.env.to_f-power.env.to_f)*@f_env).round(2) )
    end
  end
  
  xml.dataset(:seriesName=>"Others", :color=>"F1683C", :anchorBorderColor=>"F1683C", :anchorBgColor=>"F1683C")do
    @total_power.each_cons 2 do |power,next_power|
      xml.set( :value=>((next_power.others.to_f-power.others.to_f)*@f_others).round(2) )
    end
  end
  
end