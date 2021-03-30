module PriceCalculator
    class Menu
        def start
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