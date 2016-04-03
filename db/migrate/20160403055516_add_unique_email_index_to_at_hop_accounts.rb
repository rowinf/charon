class AddUniqueEmailIndexToAtHopAccounts < ActiveRecord::Migration
  def change
    add_index :at_hop_accounts, :email, unique: true
  end
end
