class AddResultToBets < ActiveRecord::Migration
  def change
    add_column :bets, :settled, :boolean
  end
end
