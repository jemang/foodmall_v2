class UsersController < ApplicationController

  before_action :set_user, except: [:index]
  def index
    
  end

  def show
    
  end

  def update
    @user.update(user_params)
    respond_with(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :phone_no, :address, :password, :password_confirmation, :avatar)
  end
  
  def set_user
    @user = User.find_by(id: params[:id])
  end
  
  
end