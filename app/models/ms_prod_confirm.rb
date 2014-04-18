#coding:utf-8
class MsProdConfirm < ActiveRecord::Base
  
  validates_uniqueness_of :date, :message=>"该日期的生产数据已被确认, 请选择其他日期！ Current Production Date Had Confirmed Already！ Please Select Another Date !"
  
end
