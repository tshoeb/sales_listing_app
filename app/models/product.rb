class Product < ActiveRecord::Base
  attr_accessible :available, :photo, :brand, :color, :description, :expiry_date, :fragile, :listing_date, :user_id, :name, :price

  mount_uploader :photo, PhotoUploader

  validates :brand, :color, :description, :expiry_date, :listing_date, :user_id, :name, :price, :presence => true

  belongs_to :user

  scope :available, where('available = ?', true)
  scope :for_user, lambda{|user_id| where("user_id = ?", user_id)}
  scope :chronological, order('listing_date DESC')
  scope :latest, lambda{|num| limit(num).order('listing_date DESC')}
end
