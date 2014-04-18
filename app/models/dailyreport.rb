#coding: utf-8

class Dailyreport < ActiveRecord::Base

  has_many :dailyreport_jobs, :dependent => :destroy, :order => "time_shift, job_title"
  
  accepts_nested_attributes_for :dailyreport_jobs, :reject_if => lambda { |a| a[:job_title].blank? }, :allow_destroy => true

  validates_uniqueness_of :date, :scope => [:date, :dept]
  
  validates :date, :dept, :manager, :presence=>true 

end
