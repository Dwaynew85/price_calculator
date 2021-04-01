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
            puts "Please enter all the items purchased seperated by a comma \n\n"
            
            puts "Item      Unit Price       Sale Price"
            puts "-----------------------------------------"
            Item.all.each { |i| puts "#{i.name}       $#{"%5.2f" % i.price}           #{i.sale}"}
            puts "\n"
            list = gets.chomp
            calculate_list(list)
        end

        def calculate_list(items)
            new_list = Hash.new(0)
            list = items.split(",").collect(&:strip)
            list.each { |k| new_list[k] += 1 } 
            items_list = new_list.collect { |item| Item.totals(item)}
            if items_list.include?(nil)
                puts "Only enter items available on the list"
                new_items = gets.chomp
                calculate_list(new_items)
            else
                results(items_list)
            end
        end

        def results(items_list) 
            total = 0
            total_without_sale = 0
            puts "\n"
            puts "Item       Quantity        Price"
            puts "-----------------------------------------"
            items_list.each do |item| 
                puts "#{item["name"]}       #{item["quantity"]}               $#{"%5.2f" % item["total"]}" 
                total += item["total"]
                total_without_sale += item["total_without_sale"]
            end
            puts "\n"
            puts "Total price: $#{"%5.2f" % total}" 
            puts "You saved $#{"%5.2f" % (total_without_sale - total)} today."
            puts "\n"
        end

    end
end