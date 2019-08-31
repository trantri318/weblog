class SessionsController < ApplicationController
  def new
    if session[:user_id]
      flash[:warning] = "You can't acess into this page"
      redirect_to root_path
    end
  end

  def destroy
    forget(current_user)
    session[:user_id] = nil
    flash[:success] = "You are logged out"
    redirect_to root_path
  end

  def create
    user = User.find_by email: params[:session][:email]
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:success] = 'You are logged in successfully'
      remember user
      redirect_to root_path
    else
      flash[:danger] = "Invalid email/password combination"
      render :new
    end
  end
end
