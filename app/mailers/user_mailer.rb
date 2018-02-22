class UserMailer < ApplicationMailer

	default from: "admin@coastline-goods.com"

	def order(order,user)
	  @order = order
	  @user = user
	  mail(to: "admin@coastline-goods.com", subject: 'Bukti Pemesanan')
	end

end
