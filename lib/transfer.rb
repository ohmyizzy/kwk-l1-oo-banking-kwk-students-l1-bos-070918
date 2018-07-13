class Transfer 
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end
  
  def valid?
    if sender.valid? && receiver.valid?
      return true 
    else
      return false 
    end
  end
  
  def execute_transaction
    if sender.valid? == true and status != "complete" and amount < sender.balance
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == 'complete'
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end
  

end