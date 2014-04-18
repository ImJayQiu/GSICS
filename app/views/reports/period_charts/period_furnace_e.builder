
xml = Builder::XmlMarkup.new(:indent=>0)

xml.chart( 
  :caption=>"Electricity Consumption Comparison", 
  :XAxisName=>"Date",
  :palette=>"1",
  :animation=>"1",
  :formatNumberScale=>"0",
  :numberPrefix=>"",
  :numberSuffix=>"",
  :showValues=>"1",
  :rotateValues=>'1',
  :seriesNameInToolTip=>"0"
  
)do
  
  
  @daily_weight=[]
  @date.each do |date, furnace|
    @daily_weight_each=@silicons.where(:date=>date).collect(&:weight).sum
    @daily_weight<<@daily_weight_each.to_i
  end
    
  @daily_e=[]
  @expense_date.sort.each do |date, expense|
    @power_day=@expense_date[date].collect(&:s1_e).sum+@expense_date[date].collect(&:s2_e).sum+@expense_date[date].collect(&:s3_e).sum
    @daily_e<<@power_day
  end
  
  @power_per_mt = @daily_e.zip(@daily_weight).map { |e,w| e.to_f/w rescue nil } rescue nil
  
  
  xml.categories(:rotateNames=>"1")do
    xml.category(:name=>"Start")
    @date.each do |date, furnace|
      xml.category(:name=>"#{date.strftime("%m-%d")}")
    end
    xml.category(:name=>"End")
  end
  
  
  
  #dataset-1 start
  xml.dataset( :seriesname=>"Electricity Consumption ( Kwh )")do
    
    xml.set(:value=>"")
    @expense_date.sort.each do |date, expense|
      @power_day=@expense_date[date].collect(&:s1_e).sum+@expense_date[date].collect(&:s2_e).sum+@expense_date[date].collect(&:s3_e).sum
      xml.set(:value=>@power_day)
    end 
    xml.set(:value=>"")
    
  end 
  #dataset-1 end

  #dataset 2 start
  xml.dataset(:seriesName=>"Kwh/MT", :parentYAxis=>"S")do
    xml.set(:value=>"0")
    @power_per_mt.each do |ppm|
      if ppm.nil?
        xml.set(:value=>"0")
      else
        xml.set(:value=>ppm.round(2))
      end
    end
    
    xml.set(:value=>"0")
  
  end 
  ##dataset-2 end

  xml.styles()do
    
    xml.definition()do
      xml.style(:type=>"font", :color=>"666666", :name=>"CaptionFont", :size=>"15")
      xml.style(:type=>"font", :name=>"SubCaptionFont", :bold=>"0")
    end #definition

    xml.application()do
      xml.apply(:toObject=>"caption", :styles=>"CaptionFont")
      xml.apply( :toObject=>"SubCaption", :styles=>"SubCaptionFont")
    end #application  
  
  end #styles
  
end # chart