class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    if session[:user_id]
      flash[:warning] = "You can't access into this page"
      redirect_to root_path
    end
    @user = User.new
  end

  def show
  end

  def destroy
    @user.destroy
    flash[:success] = "Delete user success"
    redirect_to users_path
  end

  def edit
  end

  def update
    if @user.update user_params
      flash[:success] = "Update success"
      redirect_to users_path
    else
      flash[:success] = "Update failed"
    end
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = "Register success"
      redirect_to users_path
    else
      flash[:error] = "Register failed"
      render :new
    end
  end

  private
   def set_user
     @user = User.find(params[:id])
   end

  def user_params
    params.require(:user).permit :name, :email, :phone_number, :password, :password_confirmation
  end
end
