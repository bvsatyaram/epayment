class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]

  def create
    PaymentNotification.create!(:params => params,
                                :donation_id => params[:invoice],
                                :status => params[:payment_status],
                                :transaction_id => params[:txn_id])
  end
end
