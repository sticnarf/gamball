class Team < ActiveRecord::Base
  belongs_to :league
  has_many :homes, :class_name => 'Match', :foreign_key => 'home_id'
  has_many :aways, :class_name => 'Match', :foreign_key => 'away_id'
end
