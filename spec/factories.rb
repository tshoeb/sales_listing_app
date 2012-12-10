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

	factory :purchase do
		delivery_date 2.days.ago
		user_id 1
		product_id 1
		purchase_date 5.days.ago
	end

	factory :product do
		available true
		brand "apple"
		color "white"
		description "abc"
		expiry_date 2.days.ago
		fragile true
		listing_date 10.days.ago
		user_id 1
		name "iPhone"
		price "5000 Riyals"
	end
end	