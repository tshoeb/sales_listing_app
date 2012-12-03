class User < ActiveRecord::Base
  attr_accessible :country, :email, :first_name, :last_name, :password, :password_confirmation, :phone
  has_secure_password
  validates_presence_of :password, :on => :create
end
