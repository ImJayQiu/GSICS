#coding: utf-8

class DailyreportJob < ActiveRecord::Base
  
   belongs_to :dailyreport, :foreign_key => 'dailyreport_id'
  
end
