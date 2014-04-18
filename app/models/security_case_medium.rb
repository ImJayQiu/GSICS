#coding: utf-8
class SecurityCaseMedium < ActiveRecord::Base
  
  belongs_to :security_case, :foreign_key=>'security_case_id'
  
  has_attached_file :media, 
    :url=>"/upload_photos/security_case_media/:attachment/:security_case_id/:id/:style/:filename", 
    :styles => { :small  => "600x400>", :thumb => "300x200>" }
  validates_attachment_size :media, :less_than => 100.megabytes
  
  
  before_media_post_process :process_only_medias
  
  private
  
  def process_only_medias
    if !(media.content_type =~ %r{^(image|(x-)?application)/(x-png|pjpeg|jpeg|jpg|png|gif|avi|mp4)$})
      return false 
    end
  end
  
end
