#coding: utf-8
class Pic < ActiveRecord::Base
  
  belongs_to :silicon, :foreign_key=>'silicon_id'
  
  
  
  has_attached_file :pic, 
    :url=>"/upload_photos/sipic/:attachment/:silicon_id/:id/:style/:filename", 
    :styles => { :small  => "600x400>" }
  validates_attachment_size :pic, :less_than => 10.megabytes
  
end
