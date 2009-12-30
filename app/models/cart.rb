class Cart
  attr_reader :items
    def initialize
    @items = []
  end

  def add_product(product)
    #debugger
    current_item = @items.find {|item| item.product == product}
    if current_item
      current_item.increment_quantity
    else
      current_item = CartItem.new(product)
      @items << current_item
      @items.sort{ | x, y | x.product.title <=> y.product.title }
    end
    current_item
  end
  
def remove_product(product)
    #debugger
    current_item = @items.find {|item| item.product == product}
    if current_item.quantity > 1
      current_item.decrement_quantity
      return current_item
    else
      @items.delete(current_item)
      return nil
    end
  end

def delete_product(product)
  current_item = @items.find {|item| item.product == product}
  @items.delete(current_item)
  end

def remove_all
  @items = []
end

def total_items
  @items.sum { |item| item.quantity }
end

def total_price
    @items.sum { |item| item.price }
  end
end
