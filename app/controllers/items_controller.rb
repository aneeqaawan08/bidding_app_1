class ItemsController < ApplicationController

    def new
        @item = Item.new
    end

    def create
       
        @item = Item.new(item_params)
        if @item.save!

            flash[notice]= 'item successfully added'
            redirect_to root_path(@item)
        else
            render 'new'
        end
    end

    def show
        @item = Item.find(params[:id]) 
        @bid = Bid.new
    end

    def edit
        @item = Item.find(params[:id]) 
       
    end

    def update
    
        @item = Item.find(params[:id])
        if @item.update(item_params)
            flash[:notice] = "item successfully updated"
            redirect_to items_path
        else
            render 'edit'
        end
    end

    def index
        
        @items = Item.all
    end

 def destroy
    
    @item= Item.find(params[:id])
    @item.destroy
    flash[:notice] = 'item successfully deleted'
    redirect_to items_path(@index)
   end


    private

    def item_params
                params.require(:item).permit [:title,:image, :price, :description, :user_id, :category_id]
    end




end
