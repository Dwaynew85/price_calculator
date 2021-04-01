module PriceCalculator
    class Menu
        def start
            milk = Item.new("Milk", "3.97")
            milk.save_sale("2 for $5.00")
            bread = Item.new("Bread", "2.17")
            bread.save_sale("3 for $6.00")
            Item.new("Banana", "0.99")
            Item.new("Apple", "0.89")
            main_menu
        end

        def main_menu
            puts "Please enter all the items purchased seperated by a comma"

            puts "Item      Unit Price       Sale Price"
            puts "-----------------------------------------"
            # iterate over a list of Items and display puts with name, price, and sales if it has a sale price
            Item.all.each { |i| puts "#{i.name}       $#{i.price}           #{i.sale}"}
            list = gets.chomp
            calculate_list(list)
        end

        def calculate_list(items)
            new_list = Hash.new(0)
            list = items.split(",").collect(&:strip)
            list.each { |k| new_list[k] += 1 } # {"milk"=>3, "bread"=>4, "banana"=>1, "apple"=>1}
            # execute results
        end

        def results(purchased_list) # takes a lit of items and totals and displays them in the app
            puts "Item       Quantity        Price"
            puts "-----------------------------------------"
            purchased_list.each { |purchase| puts "#{purchse.name}       #{purchase.quantity}               $#{purchase.total}" }

            puts "Total price: $#{}" # displays total price of all items
            puts "You saved $#{} today." # displays the difference between the total price without sales and total price with sales
        end

    end
end