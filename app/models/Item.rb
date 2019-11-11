class Item < ActiveRecord::Base

    has_many(:transactions)
    has_many(:consumers, { through: :transactions })


end