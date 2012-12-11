class Product < ActiveRecord::Base
  attr_accessible :available, :photo, :brand, :color, :description, :expiry_date, :fragile, :listing_date, :user_id, :name, :price

  mount_uploader :photo, PhotoUploader

  validates :brand, :color, :description, :expiry_date, :listing_date, :user_id, :name, :price, :presence => true

  belongs_to :user
  has_many :purchases

  KULER = [['Amber'], ['Aquamarine'], ['Auburn'], ['Beige'], ['Black'], ['Blue'], ['Bronze'], ['Brown'], ['Burgundy'], ['Crimson'], ['Cyan'], ['Emerald'], ['Fuchsia'], ['Gold'], ['Green'], ['Grey'], ['Indigo'], ['Ivory'], ['Jade'], ['Khaki'], ['Lavender'], ['Lemon'], ['Lilac'], ['Lime'], ['Magenta'], ['Maroon'], ['Mauve'], ['Mint'], ['Mustard'], ['Olive'], ['Orange'], ['Peach'], ['Pear'], ['Pine'], ['Pink'], ['Platinum'], ['Plum'], ['Purple'], ['Red'], ['Rose'], ['Ruby'], ['Rust'], ['Saffron'], ['Sapphire'],  ['Scarlet'], ['Shamrock'], ['Silver'], ['Tan'], ['Tangerine'], ['Teal'], ['Titanium'], ['Turquoise'], ['Vermilion'], ['Violet'], ['Viridian'], ['Wheat'],['White'],['Yellow'],['Zucchini']]
  BRAND = [['Acer'], ['Amazon'], ['Apple'], ['AT&T'], ['Benq'], ['Casio'], ['Fujitsu'], ['HP'], ['Kyocera'], ['LG'], ['Microsoft'], ['Mitsubishi'], ['Motorola'], ['O2'], ['Philips'], ['Samsung'], ['Siemens'], ['Ericsson'], ['Sony'], ['Asus'], ['BlackBerry'], ['Bosch'], ['Dell'], ['Garmin Asus'], ['Haier'], ['HTC'], ['Lenovo'], ['Micromax'], ['Nokia'], ['Orange'], ['Panasonic'], ['Sharp'], ['T Mobile'], ['Toshiba'], ['Vodafone']]
  scope :available, where('available = ?', true)
  scope :for_user, lambda{|user_id| where("user_id = ?", user_id)}
  scope :chronological, order('listing_date DESC')
  scope :latest, lambda{|num| limit(num).order('listing_date DESC')}
end
