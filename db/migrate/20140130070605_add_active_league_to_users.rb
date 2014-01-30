class AddActiveLeagueToUsers < ActiveRecord::Migration
  def change
    add_column :users, :active_leagues, :integer, :array => true
  end
end
