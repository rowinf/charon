class AtHopAccount < ActiveRecord::Base

  attr_encrypted :password, :key => ENV["AT_PASSWORDKEY"]
  has_many :purchase_records

  # renew the monthly pass for this account in the AT HOP website
  # only perform through a background process, it takes a long time
  def renew_monthly_pass(simulated=false)
    purchase_record = PurchaseRecord.create(
      at_hop_account: self,
      url: "https://at.govt.nz/bus-train-ferry/at-hop-card/my-at-hop-account/",
      simulated: simulated
    )
    RenewMonthlyPass.new.call(purchase_record: purchase_record)
  end
end
