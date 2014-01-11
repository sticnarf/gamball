class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.timestamp :time
      t.json :data
      t.belongs_to :user
      t.belongs_to :gamble
      t.timestamps
    end
  end
end
