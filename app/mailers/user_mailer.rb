class UserMailer < ActionMailer::Base
  default from: "app.design67274@gmail.com"

  def new_purchase_msg(purchase)
  	@purchase = purchase
  	mail(:to => @user.email, :subject => "New Purchase")
  end
end
