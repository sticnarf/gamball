class UsersController < ApplicationController
  before_action :user_not_signed_in, :only => [:new, :create, :index]
  before_action :user_signed_in, :only => [:show, :panel, :money]

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
      redirect_to panel_url
    else
      render :template => 'users/new', :layout => false
    end
  end

  def hall
    @active_leagues = current_user.active_leagues || []
    @leagues = League.all
  end

  def money
    render :text => current_user.money
  end

  def panel
    @unsettled = Bet.where(:user => current_user, :settled => false)
    @settled = Bet.where(:user => current_user, :settled => true)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
