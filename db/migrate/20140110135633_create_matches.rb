class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.timestamp :time
      t.integer :home_id, :index => true
      t.integer :away_id, :index => true
      t.belongs_to :league
      t.timestamps
    end
  end
end
