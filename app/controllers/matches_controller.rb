class MatchesController < ApplicationController
  def index
    leagues = (params[:leagues] || {}).keys
    leagues.each_index { |i| leagues[i] = leagues[i].to_i }
    current_user.update_attribute(:active_leagues, leagues)
    @matches = Match.where('time > ? AND cancelled = false',DateTime.now)
      .where(:league_id => leagues).order("time ASC")
  end
end
