#coding: utf-8

class WarehouseItemPhoto < ActiveRecord::Base
  
  
  belongs_to :warehouse_item, :foreign_key=>'warehouse_item_id'
  
  has_attached_file :photo, 
    :url=>"/upload_photos/warehouse_item_photos/:attachment/:warehouse_item_id/:id/:style/:filename", 
    :styles => { :small  => "600x400>", :thumb => "75x50>" }
  validates_attachment_size :photo, :less_than => 10.megabytes
  
  before_photo_post_process :process_only_images
  
  private
  
  def process_only_images
    if !(photo.content_type =~ %r{^(image|(x-)?application)/(x-png|pjpeg|jpeg|jpg|png|gif)$})
      return false 
    end
  end
  
end
