#coding: utf-8
class Sample < ActiveRecord::Base
  
  has_many :mssamples, :dependent => :destroy
  accepts_nested_attributes_for :mssamples, :reject_if => lambda { |a| a[:sdate].blank? }, :allow_destroy => true
  
  DES = %w[Norway Germany Shanghai Thailand Vietnam Singapore Others]
  COM = %w[DHL FedEx EMS] 
  
  CATE = %w[RAW 920D 940U 945SD]
  TYP = %w[Weekly EN Trial]
  LOCAT = %w[F-1 F-2 F-3 F-4 F-5 F-6 C-1 C-2 C-3 C-4 C-5 C-6 silo-1 silo-2 silo-3 silo-4 silo-5]
  WEIGHT = %w[0.5 1 2 5 10 20 50 100]
  BATCH = %w[A B MIX N/A]
    
  
    validate :validate_unique_mssamples
    
    def validate_unique_mssamples
      validate_uniqueness_of_in_memory(
        mssamples, [:cate, :location, :weight, :typ, :sample_id, :batch, :sdate, :edate], 'Duplicate Batch Number | 产 品 批 号 重 复 ！')
    end
  
  
  
end 
