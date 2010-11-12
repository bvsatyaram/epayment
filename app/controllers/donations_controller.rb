class DonationsController < ApplicationController
  def index
  end

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(:donor => params[:donation][:donor], :amount => params[:donation][:amount].to_i)
    @donation.save!
    redirect_to @donation.paypal_url(root_url)
  end
end
