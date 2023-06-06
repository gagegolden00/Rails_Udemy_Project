class SessionsController < ApplicationController
  def new
  
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "successfully logged in"
      redirect_to user
    
    else
      flash.now[:alert] = "wrong credentials"
      render 'new'
    end
  end
  def destroy
  
  end
end