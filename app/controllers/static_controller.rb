class StaticController < ApplicationController
  before_action :user_not_signed_in, :only => [:index]

  def index
  end


  def redirect
  end
end
