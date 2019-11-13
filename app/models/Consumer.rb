class Consumer < ActiveRecord::Base

    has_many(:transactions)
    has_many :items, through: :transactions

    def clear_logs
    system "clear"
    end

    def pending_transactions
        self.transactions.select do | t |
            !t.completed
        end
    end

    def completed_transactions
        self.transactions.select do |t|
            t.completed
        end
    end

    def cart 
       cart = self.pending_transactions.map do | t |
             "#{t.item.brand}: #{t.item.item_name} - $#{t.item.cost}"
        end
        clear_logs
        cart

    end   

    def checkout
        self.transactions.each do | t |
            t.completed = true
            t.save
        end
        puts "Your order has been processed"
    end  

    def order_history
        puts "in here"
        self.completed_transactions.map do |t|
            "#{t.item.brand}: #{t.item.item_name} - $#{t.item.cost}"
        end
    end
end