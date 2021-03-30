class Item
    attr_accessor :name, :price, :sale_price, :sale_quantity

    @@all = []

    def initialize(name, price)
        @name = name
        @price = price
        @@all << self
    end

    def self.all
        @@all
    end

    def save_sale(sale)
        @sale_quantity = sale[0].to_i
        @sale_price = sale[/\d{1,3}(?:[.,]\d{3})*(?:[.,]\d{2})/].to_f
    end

    def sale
        return "#{@sale_quantity} for $#{@sale_price}" #what if it has no sale price?
    end
        
end