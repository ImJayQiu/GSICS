# Be sure to restart your server when you modify this file.

# You can add backtrace silencers for libraries that you're using but don't wish to see in your backtraces.
# Rails.backtrace_cleaner.add_silencer { |line| line =~ /my_noisy_library/ }

# You can also remove all the silencers if you're trying to debug a problem that might stem from framework code.
# Rails.backtrace_cleaner.remove_silencers!
Paperclip.interpolates :silicon_id do |attachment, style|
  attachment.instance.silicon_id
end

Paperclip.interpolates :ms_shippment_id do |attachment, style|
  attachment.instance.ms_shippment_id
end

Paperclip.interpolates :quartz_id  do |attachment, style|
  attachment.instance.quartz_id
end



Paperclip.interpolates :warehouse_item_id do |attachment, style|
  attachment.instance.warehouse_item_id
end


Paperclip.interpolates :security_case_id do |attachment, style| 
  attachment.instance.security_case_id
end



#
#Paperclip::Attachment.interpolations[:si_date] = proc do |attachment, style|
#  Silicon.where( "id =?", attachment.instance.silicon_id ).date
#end