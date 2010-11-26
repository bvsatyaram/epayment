class Donation < ActiveRecord::Base

  scope :successful, :conditions => ["donations.donated_at IS NOT NULL"]

  def paypal_url(return_url, notify_url)
    values = {
      :business => 'seller_1290763494_biz@gmail.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id,
      "amount_1" => amount,
      "item_name_1" => "Donation for cause",
      "quantity_1" => 1,
      :notify_url => notify_url
    }

    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end

  def mark_successful!
    self.donated_at = Time.now
    self.save!
  end
end
