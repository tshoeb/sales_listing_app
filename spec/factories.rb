FactoryGirl.define do
	factory :user do
		first_name "Talal"
		last_name "Shoeb"
		country "Qatar"
		email "talal@cmu.edu"
		phone "+97477155015"
		password "hello"
		password_confirmation "hello"
	end	

	factory :product do
		available true
		brand "apple"
		color "white"
		description "abc"
		expiry_date 3.years.from_now
		fragile true
		listing_date 10.days.ago
		name "iPhone"
		price "5000 Riyals"
		association :user
	end

	factory :purchase do
		delivery_date 2.days.ago
		purchase_date 5.days.ago
		association :user
		association :product
	end
end	