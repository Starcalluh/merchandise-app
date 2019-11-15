require_relative './config/environment.rb'

$prompt = TTY::Prompt.new
$current_user = nil
ActiveRecord::Base.logger = nil

def clear_logs
    system "clear"
end

def ask_for_q
    puts "Please press 'q' to return to the main menu.".red
    loop do 
        ch = STDIN.getch
        if ch == "q"
            break
        end
    end
end

def welcome
    clear_logs
    a = Artii::Base.new :font => 'slant'
    puts "Greetings From:"
    puts a.asciify("Gank Merch").cyan
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
    $current_user = Consumer.find($current_user.id)
    clear_logs
    main_menu_response = $prompt.select(("Please select a option from the choices below"), ["Shop by brand", "View your cart", "View your order history", "Log out"])
    if main_menu_response === "Shop by brand"
        shop_by_brand
    elsif main_menu_response === "View your cart"
        cart_prompt
    elsif main_menu_response === "View your order history"
        order_prompt
    else
        logout
    end

end    

def cart_prompt
    clear_logs
    puts $current_user.cart
    response = $prompt.select(("Please select an option below"),["Proceed to Checkout","Return to Main-Menu"]) 
    if response === "Proceed to Checkout"
        checkout_prompt
    else
        main_menu
    end
end

def order_prompt
    puts $current_user.order_history
    ask_for_q
    main_menu
end

def logout
    clear_logs
    $current_user = nil
    welcome
end

def checkout_prompt
    response = $prompt.yes?("Do you want to check out?") 
    if response === true
        clear_logs
        $current_user.checkout
        ask_for_q
        main_menu
    else
        clear_logs
        ask_for_q
        main_menu
    end
end

def shop_by_brand
    item_brands = Item.all.map do | item | 
        item.brand
    end
    clear_logs
    user_brand = $prompt.select("which brand are you shopping for?", item_brands.uniq)


    filtered_items = Item.where({ brand: user_brand})
    choices = {}
    filtered_items.each do | item |
        choices[item.item_name] = item
    end
    clear_logs
    selected_item = $prompt.select("You are shopping for #{user_brand} items?", choices)

    item_details(selected_item)
end

def item_details(item)
    clear_logs
    puts "Here are some details about this item:"
    puts "Item: #{item.item_name}"
    puts "Brand: #{item.brand}"
    puts "Cost: #{item.cost}"
    puts "Quanity: #{item.quanity}"

    response = $prompt.yes?("Do you want to add this item to your cart?")

    if response === true
        add_to_cart(item)
    else
        main_menu
    end
end

def add_to_cart(item)
    clear_logs
    Transaction.create(item: item, consumer: $current_user, completed: false)
    clear_logs
    puts "Item added to cart!".green
    ask_for_q
    main_menu
end



welcome

