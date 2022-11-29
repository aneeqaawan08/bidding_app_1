class BidsController < ApplicationController

    def new
        @bid = Bid.new
    end

    # def new
    #     @item = Item.find(params[:item_id])
    #     @bid = @item.bids
    # end
    
    def create
      @item = Item.find(params[:item_id])
      @bid = Bid.new(bid_params)

      @bid.item_id = @item.id
      @bid.user_id = current_user.id
        @bid.save
        respond_to do |format|
            format.js
            end
    end
         
    def destroy
    
        # @item = Item.find(params[:item_id])
         @bid= Bid.find(params[:id])
        @bid.destroy
        flash[:notice] = 'bid successfully deleted'
        redirect_to item_path(@item)
    end






    def bid_params
        params.require(:bid).permit(:user_id, :item_id, :price)
    end

end
