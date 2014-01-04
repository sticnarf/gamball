class ApplicationController < ActionController::Base
  include SessionsHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_signed_in
    unless signed_in?
      redirect_to new_session_url
    end
  end

  def user_not_signed_in
    redirect_to user_url(current_user) if signed_in?
  end
end
