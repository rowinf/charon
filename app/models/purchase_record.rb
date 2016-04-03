class PurchaseRecord < ActiveRecord::Base

  belongs_to :at_hop_account
  validates :at_hop_account, presence: true

  delegate :email, to: :at_hop_account
  delegate :password, to: :at_hop_account

  state_machine :state, initial: :queue do
    event :succeeded do
      transition :queue => :success
    end
    event :failed do
      transition :queue => :failure
    end
  end
end
