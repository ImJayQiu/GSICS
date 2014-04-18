#coding: utf-8
class WarehouseSupplier < ActiveRecord::Base

  validates_uniqueness_of :code, :scope => [:code, :name]

end
