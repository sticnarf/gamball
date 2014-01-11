class Match < ActiveRecord::Base
  belongs_to :league
  belongs_to :home, :class_name => 'Team'
  belongs_to :away, :class_name => 'Team'
  has_many :gambles
end
