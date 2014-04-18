#coding: utf-8


class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :timeoutable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  
  #attr_accessible :email, :password, :password_confirmation, :remember_me, :role
  
  #ROLES = %w[admin qc_master qc sampler qc_inspector material visitor super_visitor warehouse_master warehouse_staff it_staff marketing microsilica_staff microsilica_master microsilica_manager oxygen_staff microsilica_visitor]

  #attr_accessible :username, :login
  attr_accessor :login

  protected

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  end

end
