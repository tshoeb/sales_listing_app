FactoryGirl.define do
	factory :user do
		first_name "Edwin"
		last_name "van der Sar"
		email "vds@cmu.com"
		country "Denmark"
		phone "97455641191"
		password "evds"
		password_digest "evds"
	end	
end	