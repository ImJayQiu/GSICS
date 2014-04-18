class EmployeerPhoto < ActiveRecord::Base
  
  belongs_to :employeer, :foreign_key=>'employeer_id'
  
  has_attached_file :photo, 
    :url=>"/upload_photos/employeer_photos/:attachment/:employeer_id/:id/:style/:filename", 
    :styles => { :small  => "600x400>", :thumb => "75x50>" }
  validates_attachment_size :photo, :less_than => 10.megabytes
  
  
  Paperclip.interpolates :employeer_id  do |attachment, style|
    attachment.instance.employeer_id
  end

end
