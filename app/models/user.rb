class User < ActiveRecord::Base
  attr_accessible :country, :email, :first_name, :last_name, :password, :password_confirmation, :phone
  before_save :format_phone
  has_secure_password
  has_many :purchases
  has_many :products

  validates_presence_of :password, :on => :create

  validates :country, :email, :first_name, :last_name, :password, :password_confirmation, :phone, :presence => true
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info|qa))$/i, :message => "is not a valid format"
  validates_format_of :phone, :with => /^(\+?\d{11}|\+?\d{3}?[-.]?\d{4}[-.]?\d{4})$/, :message => "should be 11 digits (country code needed) delimited with dashes only"
  COUNTRIES = [['Austria'], ['Bahrain'], ['Bangladesh'], ['Belgium'], ['China'], ['Cyprus'], ['France'], ['Germany'], ['India'], ['Italy'], ['Jordan'], ['Liechtenstein'], ['Luxembourg'], ['Malaysia'], ['Maldives'], ['Netherlands'], ['Qatar'], ['Singapore'], ['Sri Lanka'], ['Switzerland'], ['Thailand'], ['United Arab Emirates'], ['Vatican City']]

  scope :alphabetical, order('first_name')

  def proper_name
    first_name + " " + last_name
  end 

  def name 
    last_name + ", " + first_name   
  end

  private

	def format_phone
	    phone = self.phone.to_s
	    phone.gsub!(/[^0-9]/, "")
	    self.phone = phone
	end
end
