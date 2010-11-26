class DonationsController < ApplicationController
  def index
    @recent_donations = Donation.successful.all(:order => "id DESC", :limit => 5)
  end

  def new
  end

  def update
    @current_donation.donor = params[:donation][:donor]
    @current_donation.amount = params[:donation][:amount].to_i
    @current_donation.save!
    redirect_to @current_donation.paypal_url(root_url, payment_notifications_url)
  end
end
