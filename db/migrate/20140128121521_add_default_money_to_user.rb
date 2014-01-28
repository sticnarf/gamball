class AddDefaultMoneyToUser < ActiveRecord::Migration
  def change
    change_column_default :users, :money, 10000
  end
end
