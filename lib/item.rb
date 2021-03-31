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

    def save_sale(sale)
        self.sale_quantity = sale[0].to_i
        self.sale_price = sale[/\d{1,3}(?:[.,]\d{3})*(?:[.,]\d{2})/].to_f
        self.on_sale = true
    end

    def sale
        self.on_sale ? (return "#{@sale_quantity} for $#{@sale_price}0") : (nil)
    end

    def total_with_sale(quantity) #5
        if self.on_sale && quantity >= self.sale_quantity
            sale_units = quantity/sale_quantity #2
            remainder = quantity - (self.sale_quantity * sale_units) #1
            total = (sale_units * self.sale_price) + (remainder * self.price)
        else
            total = self.total_without_sale(quantity)
        end
        return total
    end

    def total_without_sale(quantity)
        self.price * quantity
    end

    def self.shopping_list(arr) # takes an arrage of shopping list items
        # sorts the shopping list items and creates an object with the item names and quantities
        # finds the item by name and runs the total method with quantity         
    end
        
end