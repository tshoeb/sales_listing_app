class Product < ActiveRecord::Base
  attr_accessible :available, :photo, :brand, :color, :description, :expiry_date, :fragile, :listing_date, :member_id, :name, :price

  mount_uploader :photo, PhotoUploader
end
