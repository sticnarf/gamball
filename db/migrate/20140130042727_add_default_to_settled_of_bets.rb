class AddDefaultToSettledOfBets < ActiveRecord::Migration
  def change
    change_column_default :bets, :settled, false
  end
end
