#coding: utf-8
class Coasilicon < ActiveRecord::Base
  
  belongs_to :coa, :foreign_key=>'coa_id'
  
end
