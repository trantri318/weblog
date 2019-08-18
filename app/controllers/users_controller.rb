class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    if session[:user_id]
      flash[:warning] = 'Ban khong co quyen truy cap vao trang nay'
      redirect_to root_path
    end
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = "Register success"
      redirect_to users_path
    else
      flash[:success] = "Register failed"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :phone_number, :password, :password_confirmation
  end
end
