class AddCancelledToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :cancelled, :boolean, :default => false
  end
end
