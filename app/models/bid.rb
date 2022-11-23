class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :item

 after_create :send_email

  def send_email
    UserMailer.with(user: self.item.user).bidding_email.deliver_now 
    UserMailer.with(user: self.user).bidder_email.deliver_now 
  end
end
