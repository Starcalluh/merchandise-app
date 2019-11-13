require_relative './config/environment.rb'

$prompt = TTY::Prompt.new
$current_user = nil

def welcome
a = Artii::Base.new :font => 'slant'
puts "Greetings From:"
puts a.asciify("Gank Merch")
puts "Where one size fits all."
log_in
end

def log_in
user_name = $prompt.ask("What is your name?")
$current_user = Consumer.find_or_create_by(name: user_name)
puts "Welcome #{$current_user.name}" 
main_menu
end

def main_menu
    user_response = $prompt.select(("Please select a option from the choices below"), ["Shop by brand", "View your cart", "Log out"])
    if user_response === "Shop by brand"
        shop_by_brand
    elsif user_response === "View your cart"
        puts "cart"
        #add a view_cart function
    else 
        $current_user = nil
        welcome
    end

end    

def shop_by_brand
    item_brands = Item.all.map do | item | 
        item.brand
    end
    puts item_brands.uniq
    user_brand = $prompt.select("which brand are you shopping for?", item_brands.uniq)


    filtered_items = Item.where({ brand: user_brand})
    choices = {}
    filtered_items.each do | item |
        choices[item.item_name] = item
    end
    selected_item = $prompt.select("You are shopping for #{user_brand} items?", choices)

    item_details(selected_item)
end

def item_details(item)
    puts "Here are some details about this item:"
    puts "Item: #{item.item_name}"
    puts "Brand: #{item.brand}"
    puts "Cost: #{item.cost}"
    puts "Quanity: #{item.quanity}"

    response = $prompt.yes?("Do you want to add this item to your cart?")
    puts response
    if response === true
        add_to_cart(item)
    else
        main_menu
    end
end

def add_to_cart(item)
    Transaction.create(item: item, consumer: $current_user, completed: false)
    main_menu
end

def view_cart
    $current_user.transaction.select do | t |
        !t. 
end    



welcome

