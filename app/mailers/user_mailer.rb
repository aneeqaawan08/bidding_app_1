class UserMailer < ApplicationMailer
    default from: 'aneeqaawan08@gmail.com'
    def bidding_email
        @user=params[:user]
        mail(to: @user.email,
             subject: 'New bidding' )
    end
    def bidder_email
        @user=params[:user]
        mail(to: @user.email,
             subject: 'New bidding' )
    end

end