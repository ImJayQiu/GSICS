utf8_arr = [0xEF,0xBB,0xBF]
utf8_str = utf8_arr.pack("c3")

xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( :manageResize=>"1", :dateFormat=>"mm/dd/yyyy", :outputDateFormat=>"hh:mn", :caption=>"GSE Vehicles' Work Schedule", :subCaption=>@date) do
  
  
  xml.categories() do
    xml.category( :start=>"#{@date} 00:00:00", :end=>"#{@date} 23:59:59", :label=>@date )
  end #end of xml.categories

  xml.categories( :align=>"center", :fontSize=>"10")do

    xml.category( :start=>"#{@date} 00:00:00", :end=>"#{@date} 07:59:59", :label=>"Shift-1")
    xml.category( :start=>"#{@date} 08:00:00", :end=>"#{@date} 15:59:59", :label=>"Shift-2")
    xml.category( :start=>"#{@date} 16:00:00", :end=>"#{@date} 23:59:59", :label=>"Shift-3")
    
  end #end of xml.categories

  xml.processes( :fontSize=>"12", :isBold=>"1", :align=>"left", :headerText=>"Vehicle", :headerFontSize=>"18", :headerVAlign=>"bottom", :headerAlign=>"left")do
    @r_code = requests.group_by{|r|r.v_code}
    @r_code.sort.each do |code,r|
      xml.process( :label=>code, :id=>code)
    end # end of @r_code.sort.each
  end # end of xml.processes

  xml.tasks( :showLabels=>"1", :showStartDate=>"1")do
    requests.each do |r|
      xml.task( :processId=>r.v_code, :start=>r.s_time, :end=>r.e_time, :label=>r.dept)
    end #end of requests.sort.each
  end # end of xml.tasks

end # end of xml.chart
