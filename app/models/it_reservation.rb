#coding:utf-8

class ItReservation < ActiveRecord::Base

  validates :date, :device, :user, :dept, :location, :presence => true
      
end
