
class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  def index
    @users = User.paginate(page: params[:page], per_page: 3)
    
  end
  def new
    @user = User.new()
  end
  def create
    @user = User.new(whitelist_params)
    if @user.save
      redirect_to articles_path, notice: "sign up successful #{@user.username}"
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(whitelist_params)
      redirect_to edit_user_path, notice: "update successful"
    end
    
  end
  
  private
  def whitelist_params
  params.require(:user).permit(:username, :email, :password)
  end
  
end

