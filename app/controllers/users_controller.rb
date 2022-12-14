class UsersController < ApplicationController
  def show
    @user = current_user
        # @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end 

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        flash[:notice] = 'User successfully updated'
        redirect_to user_path(@user)
    else
        render 'new'
    end
  end
 
  def index
     @users = User.all
  end

  def destroy
    @user= User.find(params[:id])
    @user.destroy
    flash[:notice] = 'user successfully deleted'
    redirect_to users_path(@index)
end

end