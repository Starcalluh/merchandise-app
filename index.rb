require_relative './config/environment.rb'

prompt = TTY::Prompt.new
a = Artii::Base.new :font => 'slant'
puts "Greetings From:"
puts a.asciify("Gank Merch")
puts "Where one size fits all.
"
item_brand = Item.all.map do | item | 
    item.brand
end

user_brand = prompt.select("which brand are you shopping for?", item_brand.uniq)

items_brand = Item.where({ brand: user_brand})
item_receipt = {}
item_receipt = items_brand.map do | item | 
   item_receipt["Item: #{item.item_name} $#{item.cost}, #{item.quanity} left in stock"]= item
end
users_items = prompt.select("You are shopping for #{user_brand} items?", item_receipt)



