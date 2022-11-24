class CategoriesController < ApplicationController
    load_and_authorize_resource

    def new
        @category = Category.new
    end

    def create
       
        @category = Category.new(category_params)
        if @category.save!
            flash[notice]= 'category successfully added'
            redirect_to root_path
        else
            render 'new'
        end
    end

    def show
        @category = Category.find(params[:id]) 
       
    end


    def index
        
        @categories = Category.all
       
    end
    
    def edit
        @category = Category.find(params[:id])
    end
    
    
    def update
    
            @category = Category.find(params[:id])
            if @category.update(category_params)
                flash[:notice] = "category successfully updated"
                redirect_to category_path(@category)
            else
                render 'edit'
            end
    end

    def destroy
        @category= Category.find(params[:id])
        @category.destroy
        flash[:notice] = 'category successfully deleted'
        redirect_to categories_path(@index)
    end


private

def category_params
            params.require(:category).permit [:title,:image]
end




end
