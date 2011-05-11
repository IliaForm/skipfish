class AddBalanceToUsers < ActiveRecord::Migration
  def self.up
  add_column :users, :balance, :float, :default => 0
  end
  

  def self.down
  	remove_column :users, :balance, :float, :default => 0
  end
end
