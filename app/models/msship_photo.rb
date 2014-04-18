#coding: utf-8
class MsshipPhoto < ActiveRecord::Base
  
  belongs_to :ms_shippment, :foreign_key=>'ms_shippment_id'
  has_attached_file :photo, 
    :url=>"/upload_photos/ms_ship_photos/:attachment/:ms_shippment_id/:id/:style/:filename", 
    :styles => { :small  => "600x400>" }
  validates_attachment_size :photo, :less_than => 10.megabytes
  
end
