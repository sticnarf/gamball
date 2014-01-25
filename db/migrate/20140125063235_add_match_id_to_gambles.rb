class AddMatchIdToGambles < ActiveRecord::Migration
  def change
    add_column :gambles, :match_id, :integer
  end
end
