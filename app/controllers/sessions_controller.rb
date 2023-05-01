class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email params[:email]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id # Log in the user
      redirect_to root_path, notice: "Logged in!"
    else
      flash[:alert] = "Wrong credentials"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil # Log out the user
    redirect_to sessions_new_path, notice: "Logged out!"
  end


end
