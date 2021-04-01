module PriceCalculator
    class Item
        attr_accessor :name, :price, :on_sale, :sale_price, :sale_quantity
    
        @@all = []
    
        def initialize(name, price, on_sale=false)
            @name = name
            @price = price.to_f
            @@all << self
        end
    
        def self.all
            @@all
        end
    
        def self.find_by_name(name)
            self.all.find { |i| i.name == name.capitalize }
        end
    
        def save_sale(sale)
            self.sale_quantity = sale[0].to_i
            self.sale_price = sale[/\d{1,3}(?:[.,]\d{3})*(?:[.,]\d{2})/].to_f
            self.on_sale = true
        end
    
        def sale
            self.on_sale ? (return "#{@sale_quantity} for $#{"%5.2f" % @sale_price}") : (nil)
        end
    
        def total_with_sale(quantity) 
            if self.on_sale && quantity >= self.sale_quantity
                sale_units = quantity/sale_quantity
                remainder = quantity - (self.sale_quantity * sale_units) 
                total = (sale_units * self.sale_price) + (remainder * self.price)
            else
                total = self.total_without_sale(quantity)
            end
            return total
        end
    
        def total_without_sale(quantity)
            self.price * quantity
        end
    
        def self.totals(item)
            grocery_list = Hash.new(0)
            grocery = self.find_by_name(item[0])
            if grocery
                grocery_list["name"] = grocery.name
                grocery_list["quantity"] = item[1]
                grocery_list["total"] = grocery.total_with_sale(item[1])
                grocery_list["total_without_sale"] = grocery.price * item[1]
                grocery_list
            else
                puts "Invalid item(s) \n\n"
            end       
        end        
    end
end