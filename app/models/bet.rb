class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :gamble

  def money
    self.data['money']
  end
end
