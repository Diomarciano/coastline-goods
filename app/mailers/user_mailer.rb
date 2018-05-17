class UserMailer < ApplicationMailer

	 default from: "info@coastline-goods.com"

  def order_mail(order, user)
    @user = user
    @order = order
  	mail(to: @order.user.email, subject: 'Bukti Pembelian')
  end

  def konfirm_mail(konfirm, user)
    @user = user
    @konfirm = konfirm
  	mail(to: @konfirm.user.email, subject: 'Konfirmasi Pembayaran')
  end

end
