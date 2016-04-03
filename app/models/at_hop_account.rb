class AtHopAccount < ActiveRecord::Base

  attr_encrypted :password, :key => ENV["AT_PASSWORDKEY"]

  # renew the monthly pass for this account in the AT HOP website
  # only perform through a background process, it takes a long time
  def renew_monthly_pass
    RenewMonthlyPass.new.call(email: email, password: password)
  end
end
