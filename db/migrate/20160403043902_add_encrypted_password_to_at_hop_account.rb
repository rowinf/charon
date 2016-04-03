class AddEncryptedPasswordToAtHopAccount < ActiveRecord::Migration
  def change
    add_column :at_hop_accounts, :encrypted_password, :text
    add_column :at_hop_accounts, :encrypted_password_iv, :text
  end
end
