class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.sender.balance >= self.amount && self.receiver.valid? && self.status == "pending"
  end

  def execute_transaction


      if self.status != "complete" && sender.valid? == true && receiver.valid? == true
        if sender.balance >= amount
          receiver.balance = receiver.balance + amount
          sender.balance = sender.balance - amount
          self.status = "complete"
        else
          "Transaction rejected. Please check your account balance."
        end
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end


    end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end


end #class Transfer
