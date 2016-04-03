class CreatePurchaseRecords < ActiveRecord::Migration
  def change
    create_table :purchase_records do |t|
      t.integer :at_hop_account_id
      t.string :state
      t.boolean :simulated, default: false
      t.text :url
      t.timestamps null: false
    end
  end
end
