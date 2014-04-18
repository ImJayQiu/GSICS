class SummaryController < ApplicationController
  
  def index
    @silicons = Silicon.all :order => "furnace, shift, no, date DESC"
    @furnace = @silicons.group_by { |a|a.furnace}
    @shift= @furnace.group_by { |a|a.shift}
 
    
  end

end
