module PriceCalculator
    class Menu
        def start
            milk = Item.new("Milk", "3.97")
            milk.save_sale("2 for $5.00")
            bread = Item.new("Bread", "2.17")
            bread.save_sale("2 for $6.00")
            banana = Item.new("Banana", "0.99")
            apple = Item.new("Apple", "0.89")
            main_menu
        end

        def main_menu
            puts "Item      Unit Price       Sale Price"
            puts "-----------------------------------------"
            # iterate over a list of Items and display puts with name, price, and sales if it has a sale price
            list = gets.chomp
        end
    end
end