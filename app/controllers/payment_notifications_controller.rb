class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]
  skip_before_filter :fetch_current_donation

  def create
    PaymentNotification.create!(:params => params,
                                :donation_id => params[:invoice],
                                :status => params[:payment_status],
                                :transaction_id => params[:txn_id])
    render :nothing => true
  end
end
