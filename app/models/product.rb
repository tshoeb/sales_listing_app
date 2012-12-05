class Product < ActiveRecord::Base
  attr_accessible :available, :photo, :brand, :color, :description, :expiry_date, :fragile, :listing_date, :member_id, :name, :price

  mount_uploader :photo, PhotoUploader

  validates :photo, :brand, :color, :description, :expiry_date, :listing_date, :member_id, :name, :price, :presence => true

  scope :available, where('available = ?', true)
end
