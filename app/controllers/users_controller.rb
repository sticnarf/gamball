class UsersController < ApplicationController
  before_action :user_not_signed_in, :only => [:new, :create, :index]
  before_action :user_signed_in, :only => [:show]

  def show
    @user = User.find(params[:id])
  end

  def index
  end

  def new
    @user = User.new
    if request.headers['X-PJAX']
      render :layout => false
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to user_url(@user)
    else
      render :template => 'users/new', :layout => false
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
