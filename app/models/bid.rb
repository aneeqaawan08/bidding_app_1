class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :item

 after_create :send_email

  def send_email
    UserMailer.with(user: self.item.user).bidding_email.deliver_now 
    UserMailer.with(user: self.user).bidder_email.deliver_now 
  end

  before_create :bid_price
  
  def bid_price
    if self.price < item.price 
      self.errors.add(:base, 'bid price should be greater than item price.')  
      throw :abort  
    end
  end

   before_create :all_bid

  def all_bid
    item.bids.each do |bid|
      if bid.price > self.price
        self.errors.add(:base, 'bid price should be greater than all previous bids.')
        throw :abort
      end
    end
  end

end
