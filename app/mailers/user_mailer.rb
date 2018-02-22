class UserMailer < ApplicationMailer

	 default from: "info@handbo.id"

  def order_mail(order, user)
    @user = user
    @order = order
  	mail(to: @order.user.email, subject: 'Bukti Pembelian')
  end

end
