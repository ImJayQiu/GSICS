class SiteController < ApplicationController
  
  layout "index"
  
  def index
    #show silicaon test result 
    @silicons = Silicon.select("date, fe, al, ca, furnace, grade, weight").limit(1000).order("date DESC, furnace, shift DESC, no DESC")
    @furnace = @silicons.group_by { |a|a.furnace}
  
    #show safety cases
    @security_case = SecurityCase.all(:order => 'datetime DESC', :limit => 6)
    
  end
  
end
