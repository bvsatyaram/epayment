class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :fetch_current_donation

  def fetch_current_donation
    if session[:donation_id]
      @current_donation ||= Donation.find(session[:session_id])
      session[:donation_id] = nil if @current_donation.donated_at
    end
    if session[:donation_id].nil?
      @current_donation = Donation.create!
      session[:donation_id] = @current_donation.id
    end
    @current_donation
  end
end
