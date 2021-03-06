class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/messages'
    else
      redirect_to '/signup'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
  
  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
  
end
