class PaymentNotification < ActiveRecord::Base
  belongs_to :donation
  serialize :params
  after_create :mark_donation_complete

  private

  def mark_donation_complete
    if status == "completed"
    end
  end
end
