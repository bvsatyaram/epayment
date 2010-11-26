class AddDonationTimeToDonations < ActiveRecord::Migration
  def self.up
    add_column :donations, :donated_at, :datetime
  end

  def self.down
    remove_column :donations, :donated_at
  end
end
