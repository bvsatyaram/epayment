class PaymentNotificationsController < ApplicationController
  def create
    PaymentNotification.create!(:params => params, :donation_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id])
  end
end