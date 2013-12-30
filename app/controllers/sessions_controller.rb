class SessionsController < ApplicationController
  before_action :user_signed_in, :only => [:destroy]
  before_action :user_not_signed_in, :only => [:new, :create]

  def new
  end

  def create
    user = User.find_by(:email => params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      flash[:success] = "You have successfully signed in"
      redirect_to user_url(user)
    else
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:success] = "You have successfully signed out"
    redirect_to root_url
  end
end
