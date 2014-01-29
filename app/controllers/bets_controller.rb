class BetsController < ApplicationController
  before_action :user_signed_in, :only => [:new, :create]
  def new
    @bet = Bet.new(:user => current_user, :gamble_id => params[:gamble], :data => {})
    @bet.data['result'] = params[:result]
    @match = @bet.gamble.match
    if request.headers['X-PJAX']
      render :layout => false
    end
  end

  def create
    money = params[:bet][:money].to_d
    @bet = Bet.new(:gamble_id => params[:gamble], :data => {'money' => money, 'result' => params[:result]})
    @match = @bet.gamble.match
    if money <= 0 or money > current_user.money
      @error = true
      render :template => 'bets/new', :layout => false
    else
      @bet.user = current_user
      @bet.save
      current_user.update_attribute(:money, current_user.money - money)
      render :template => 'bets/create', :layout => false
    end
  end

end
