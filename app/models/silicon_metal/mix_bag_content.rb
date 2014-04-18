# coding: utf-8

class SiliconMetal::MixBagContent < ActiveRecord::Base

  belongs_to :mix_bag, :foreign_key => 'mix_bag_id'
  
end
