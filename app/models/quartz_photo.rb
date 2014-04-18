#coding: utf-8

class QuartzPhoto < ActiveRecord::Base
  
  belongs_to :quartz, :foreign_key=>'quartz_id'
  
  has_attached_file :photo, 
    :url=>"/upload_photos/quartz_photos/:attachment/:quartz_id/:id/:style/:filename", 
    :styles => { :small  => "600x400>", :thumb => "75x50>" }
  validates_attachment_size :photo, :less_than => 10.megabytes
  
end
