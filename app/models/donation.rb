class Donation < ActiveRecord::Base
  def paypal_url(return_url)
    values = {
      :business => 'seller_1290763494_biz@gmail.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id,
      "amount_1" => amount,
      "item_name_1" => "Donation for cause",
#      "item_number_1" => 1,
      "quantity_1" => 1
    }

    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
