#coding: utf-8

class Purchase::RequestPhoto < ActiveRecord::Base

  belongs_to :request,  :foreign_key=>'request_id'
  #class_name:"Purchase::Request",
  
  
  has_attached_file :photo, 
    :url=>"/upload_photos/purchase_request_photos/:attachment/:request_id/:id/:style/:filename", 
    :styles => { :small  => "600x400>", :thumb => "75x50>" }
  validates_attachment_size :photo, :less_than => 10.megabytes
  
  
  Paperclip.interpolates :request_id do |attachment, style| 
    attachment.instance.request_id
  end

end
