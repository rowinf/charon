class CreateAtHopAccounts < ActiveRecord::Migration
  def change
    create_table :at_hop_accounts do |t|
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :run_on_day
    end
  end
end
