class MatchesController < ApplicationController
  def index
    @matches = Match.where('time > ? AND cancelled = false', DateTime.now)
  end
end
