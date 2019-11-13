class Consumer < ActiveRecord::Base

    has_many(:transactions)
    has_many :items, through: :transactions

    def cart 
       pending_transactions = self.transactions.select do | t |
        !t.completed
        end
    end    
end