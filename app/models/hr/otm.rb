#coding: utf-8

class Hr::Otm < ActiveRecord::Base

  validates :e_id,:dept,:date,:stime,:etime,:reason, :presence=>true
   
end
