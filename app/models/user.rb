class User < ActiveRecord::Base
  attr_accessible :country, :email, :first_name, :last_name, :password, :password_confirmation, :phone
  before_save :format_phone
  has_secure_password
  validates_presence_of :password, :on => :create
  validates :country, :email, :first_name, :last_name, :password, :password_confirmation, :phone, :presence => true
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info|qa))$/i, :message => "is not a valid format"
  validates_format_of :phone, :with => /^(\+?\d{11}|\+?\d{3}?[-.]?\d{4}[-.]?\d{4})$/, :message => "should be 11 digits (country code needed) delimited with dashes only"
  COUNTRIES = [['Qatar', 'QA'], ['Saudi Arabia', 'KSA'], ['United Arab Emirates', 'UAE']
  
  scope :alphabetical, order('last_name, first_name')

  private

	def format_phone
	    phone = self.phone.to_s
	    phone.gsub!(/[^0-9]/, "")
	    self.phone = phone
	end
end
