class DeleteTimeFromBets < ActiveRecord::Migration
  def change
    remove_column :bets, :time
  end
end
