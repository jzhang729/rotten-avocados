class Admin::UsersController < ApplicationController

  before_filter :restrict_access
  before_filter :require_admin , except: [:switch_back_to_admin]

  def index
    @user = User.new
    @users = User.order(:firstname).page(params[:page]).per(5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    @user.update(admin:1)
    redirect_to admin_users_path, notice: "#{@user.firstname} is now an admin"
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: "User ID #{@user.id} deleted"
  end

  def switch_to_user
    session[:admin_id] = current_user.id
    session[:user_id] = params[:id]
    redirect_to root_path
  end

  def switch_back_to_admin
    session[:user_id] = session[:admin_id]
    redirect_to admin_users_path
  end
  
  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :admin)
  end

end
