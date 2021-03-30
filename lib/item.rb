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
        
end