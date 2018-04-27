class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def order_confirmation(order)
    @order = order
    @url  = 'http://example.com/login'
    mail(to: @order.email, subject: "Your Jungle Order #{@order.id}")
  end
end
