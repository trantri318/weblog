class SessionsController < ApplicationController
  def new
    if session[:user_id]
      flash[:warning] = 'Ban khong co quyen truy cap vao trang nay'
      redirect_to root_path
    end
  end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Login Success"
      redirect_to root_path
    else
      flash[:danger] = "Invalid email/password combination"
      render :new
    end
  end
end
