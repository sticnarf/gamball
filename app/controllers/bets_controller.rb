class BetsController < ApplicationController
  def new
    @bet = Bet.new(:user => current_user, :gamble_id => params[:gamble], :data => {})
    @bet.data['result'] = params[:result]
    @match = @bet.gamble.match
    if request.headers['X-PJAX']
      render :layout => false
    end
  end
end
