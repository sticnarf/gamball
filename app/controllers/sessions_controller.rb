class SessionsController < ApplicationController
  before_action :user_signed_in, :only => [:destroy]
  before_action :user_not_signed_in, :only => [:new, :create, :index]

  def new
    if request.headers['X-PJAX']
      render :layout => false
    end
  end

  def index
  end


  def create
    user = User.find_by(:email => params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      redirect_to user_url(user)
    else
      @error = true
      render :template => 'sessions/new', :layout => false
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
