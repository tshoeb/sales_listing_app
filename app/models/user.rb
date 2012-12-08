class User < ActiveRecord::Base
  attr_accessible :country, :email, :first_name, :last_name, :password, :password_confirmation, :phone
  has_secure_password
  validates_presence_of :password, :on => :create

  COUNTRY_LIST = [['Austria'], ['Bahrain'], ['Bangladesh'], ['Belgium'], ['China'], ['Cyprus'], ['France'], ['Germany'], ['India'], ['Italy'], ['Jordan'], ['Liechtenstein'], ['Luxembourg'], ['Malaysia'], ['Maldives'], ['Netherlands'], ['Qatar'], ['Singapore'], ['Sri Lanka'], ['Switzerland'], ['Thailand'], ['United Arab Emirates'], ['Vatican City']]
end
