class CreateGambles < ActiveRecord::Migration
  def change
    create_table :gambles do |t|
      t.string :type
      t.json :data

      t.timestamps
    end
  end
end
